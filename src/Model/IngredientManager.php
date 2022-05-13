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
        $query = 'SELECT i.id, i.name AS ingredient_name, i.type_id, i.image, t.name AS type
        FROM ' . static::TABLE . ' AS i
        INNER JOIN type AS t 
        ON i.type_id = t.id';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }
        return $this->pdo->query($query)->fetchAll();
    }

    /**
     * Search ingredient in database
     */
    public function searchIngredientByName(string $ingredient): array|false
    {
        $statement = $this->pdo->prepare("SELECT i.name AS ingredient, i.type_id, i.image, t.name AS type 
        FROM " . static::TABLE . " AS i 
        INNER JOIN type AS t
        ON i.type_id = t.id
        WHERE i.name LIKE :name AND i.type_id != 3");
        $statement->bindValue('name', '%' . $ingredient . '%', \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetchAll();
    }

    /**
     * Get one row from database by ID.
     */
    public function selectOneById(int $id): array|false
    {
        $statement = $this->pdo->prepare("SELECT i.id, i.name AS ingredient, i.type_id, i.image, t.name AS type
        FROM " . static::TABLE . " AS i 
        INNER JOIN type AS t 
        ON i.type_id = t.id 
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
