<?php

namespace App\Model;

class RecipeManager extends AbstractManager
{
    public const TABLE = 'recipe';

    /**
     * Search recipe in database
     */
    public function searchRecipesByName(string $recipe): array|false
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . self::TABLE . " WHERE name LIKE :name");
        $statement->bindValue('name', '%' . $recipe . '%', \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetchAll();
    }

    /**
     * Insert new recipe in database
     */
    public function insert(array $recipe): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`name`, `description`, `image`) 
        VALUES (:name, :description, :image)");
        $statement->bindValue('name', $recipe['name'], \PDO::PARAM_STR);
        $statement->bindValue('description', $recipe['description'], \PDO::PARAM_STR);
        $statement->bindValue('image', $recipe['image'], \PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    /**
     * Update recipe in database
     */
    public function update(array $recipe): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `name` = :name, 
        `description` = :description, `image` = :image WHERE id=:id");
        $statement->bindValue('id', $recipe['id'], \PDO::PARAM_INT);
        $statement->bindValue('name', $recipe['name'], \PDO::PARAM_STR);
        $statement->bindValue('description', $recipe['description'], \PDO::PARAM_STR);
        $statement->bindValue('image', $recipe['image'], \PDO::PARAM_STR);

        return $statement->execute();
    }
}
