<?php

namespace App\Model;

class IngredientManager extends AbstractManager
{
    public const TABLE = 'ingredient';

    /**
     * Select all ingredients in database
     */
    public function selectAllIngredients(string $orderBy = '', string $direction = 'ASC'): array
    {
        // $query = 'SELECT i.id, i.name AS ingredient_name, i.type_id, i.image, t.name AS type_name,
        // m.name AS month_name, r.name AS recipe_name, r.description, r.image AS cocktail
        // FROM ' . static::TABLE . ' AS i
        // INNER JOIN type AS t
        // ON i.type_id = t.id
        // INNER JOIN month_ingredient AS mi
        // ON mi.ingredient_id = i.id
        // INNER JOIN recipe_ingredient AS ri
        // ON ri.ingredient_id = i.id
        // INNER JOIN month AS m
        // ON mi.month_id = m.id
        // INNER JOIN recipe AS r
        // ON ri.recipe_id = r.id';
        $query = 'SELECT i.id, i.name AS ingredient_name, i.type_id, t.name AS type_name, i.image, t.name AS type
        FROM ingredient AS i
        INNER JOIN type AS t
        ON i.type_id = t.id';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }
        return $this->pdo->query($query)->fetchAll();
    }

    /**
     * Get one row from database by ID.
     */
    public function selectOneById(int $id): array|false
    {
        $statement = $this->pdo->prepare("SELECT i.id, i.name AS ingredient, i.type_id, i.image, 
        t.name AS type, m.name AS month, r.name AS recipe, r.description, r.image AS cocktail 
        FROM " . static::TABLE . " AS i 
        INNER JOIN type AS t 
        ON i.type_id = t.id 
        INNER JOIN month_ingredient AS mi 
        ON mi.ingredient_id = i.id 
        INNER JOIN recipe_ingredient AS ri 
        ON ri.ingredient_id = i.id 
        INNER JOIN month AS m 
        ON mi.month_id = m.id 
        INNER JOIN recipe AS r 
        ON ri.recipe_id = r.id 
        WHERE i.id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
    }

    /**
     * Insert new ingredient in database
     */
    public function insert(array $ingredient): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`name`, `type_id`, `image`) 
        VALUES (:name, :type_id, :image)");
        $statement->bindValue('name', $ingredient['name'], \PDO::PARAM_STR);
        $statement->bindValue('type_id', $ingredient['type_id'], \PDO::PARAM_INT);
        $statement->bindValue('image', $ingredient['image'], \PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    /**
     * Update ingredient in database
     */
    public function update(array $ingredient): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `name` = :name, 
        `type_id` = :type_id, `image` = :image WHERE id=:id");
        $statement->bindValue('id', $ingredient['id'], \PDO::PARAM_INT);
        $statement->bindValue('name', $ingredient['name'], \PDO::PARAM_STR);
        $statement->bindValue('type_id', $ingredient['type_id'], \PDO::PARAM_INT);
        $statement->bindValue('image', $ingredient['image'], \PDO::PARAM_STR);

        return $statement->execute();
    }
}
