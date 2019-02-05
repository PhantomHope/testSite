<?php

require 'database/database.php';

Class Category 
{
	/**
	* @var link on database connection
	*/
	protected $db;
	/**
	* @var Name of category
	* Если значение конструктору не передано, то будут загружены из БД все категории
	*/

	protected $name;

	public function __construct($name=null)
	{
		$this->db = new Database();

		if(!is_null($name)) $this->name = $name;

	}
	/**
	* Получение категорий товаров. Если имя не указано, то возвращаются все категории
	*@return array
	*/
	public function getCategories()
	{
		$params = '';
		if(isset($this->name)) $params = "WHERE `name`='$this->name'";
			
		$query = $this->db->query("SELECT * FROM `categories`" . $params);

		return $query;
	}

	/**
	* Получение финального массива товаров по категориям
	*@return array
	*/
	public function getCategoriesWithProducts()
	{
		$categories = $this->getCategories();

		$product = $this->getProducts();

		$relation = $this->getRelation();

		$result = array();

		foreach ($categories as $key) {
			$result[$key->id] = array();
		}

		foreach ($product as $item) {
			foreach ($relation as $key) {
				if($item->id == $key->productID) array_push($result[$key->categoryID], $item);
			}
		}

		return $result;
	}

	/**
	* Получение товаров, принадлежащих выбранной категории! Если категория не выбрана, то возвращает все товары
	* принадлежащие хотя бы одной категории
	*@return array
	*/
	private function getProducts()
	{
		$params = '';

		if(isset($this->name)) $params = "WHERE `categoryID` = '{$this->getCategories()[0]->id}'";

		$arrayProducts = $this->db->query("SELECT * FROM `product` WHERE id = ANY( SELECT DISTINCT productID FROM `category_products` {$params})");

		return $arrayProducts;
	}

	/**
	* Получение таблицы отношений категории -> товар
	*@return array
	*/
	private function getRelation()
	{	
		$params = '';

		if(isset($this->name)) $params = "WHERE `categoryID` = '{$this->getCategories()[0]->id}'";

		$relation = $this->db->query("SELECT * FROM `category_products` {$params}");
		
		return $relation;
	}
}