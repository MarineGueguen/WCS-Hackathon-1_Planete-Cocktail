<?php

namespace App\Model;

class RecipeManager extends AbstractManager
{
    public const TABLE = 'recipe';

    /**
     * Select all recipes in database
     */
    public function selectAll(string $orderBy = '', string $direction = 'ASC'): array
    {
        $query = 'SELECT i.id, i.name AS ingredient, i.type_id, i.image, 
        t.name AS type, m.name AS month, r.name AS recipe, r.description, r.image AS cocktail 
        FROM ' . static::TABLE . ' AS r
        INNER JOIN recipe_ingredient AS ri
        ON ri.recipe_id = r.id
        INNER JOIN ingredient AS i
        ON ri.ingredient_id = i.id
        INNER JOIN type AS t 
        ON i.type_id = t.id
        INNER JOIN month_ingredient AS mi
        ON mi.ingredient_id = i.id
        INNER JOIN month AS m
        ON mi.month_id = m.id';
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
        $statement = $this->pdo->prepare('SELECT i.id, i.name AS ingredient, i.type_id, i.image, 
        t.name AS type, m.name AS month, r.name AS recipe, r.description, r.image AS cocktail 
        FROM ' . static::TABLE . ' AS r
        INNER JOIN recipe_ingredient AS ri
        ON ri.recipe_id = r.id
        INNER JOIN ingredient AS i
        ON ri.ingredient_id = i.id
        INNER JOIN type AS t 
        ON i.type_id = t.id
        INNER JOIN month_ingredient AS mi
        ON mi.ingredient_id = i.id
        INNER JOIN month AS m
        ON mi.month_id = m.id
        WHERE r.id=:id');
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
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
