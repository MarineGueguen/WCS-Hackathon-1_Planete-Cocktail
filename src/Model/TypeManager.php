<?php

namespace App\Model;

class TypeManager extends AbstractManager
{
    public const TABLE = 'type';

    /**
     * Insert new type in database
     */
    public function insert(array $type): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`name`) VALUES (:name)");
        $statement->bindValue('name', $type['name'], \PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    /**
     * Update type in database
     */
    public function update(array $type): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `name` = :name WHERE id=:id");
        $statement->bindValue('id', $type['id'], \PDO::PARAM_INT);
        $statement->bindValue('name', $type['name'], \PDO::PARAM_STR);

        return $statement->execute();
    }
}
