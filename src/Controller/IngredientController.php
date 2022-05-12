<?php

namespace App\Controller;

use App\Model\IngredientManager;

class IngredientController extends AbstractController
{
    /**
     * List ingredients
     */
    public function index(): string
    {
        $ingredientManager = new IngredientManager();
        $ingredients = $ingredientManager->selectAll('title');

        return $this->twig->render('Ingredient/index.html.twig', ['ingredients' => $ingredients]);
    }

    /**
     * Show informations for a specific ingredient
     */
    public function show(int $id): string
    {
        $ingredientManager = new IngredientManager();
        $ingredient = $ingredientManager->selectOneById($id);

        return $this->twig->render('Ingredient/show.html.twig', ['ingredient' => $ingredient]);
    }

    /**
     * Edit a specific ingredient
     */
    public function edit(int $id): ?string
    {
        $ingredientManager = new IngredientManager();
        $ingredient = $ingredientManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $ingredient = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, update and redirection
            $ingredientManager->update($ingredient);

            header('Location: /ingredients/show?id=' . $id);

            // we are redirecting so we don't want any content rendered
            return null;
        }

        return $this->twig->render('Ingredient/edit.html.twig', [
            'ingredient' => $ingredient,
        ]);
    }

    /**
     * Add a new ingredient
     */
    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $ingredient = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $ingredientManager = new IngredientManager();
            $id = $ingredientManager->insert($ingredient);

            header('Location:/ingredients/show?id=' . $id);
            return null;
        }

        return $this->twig->render('Ingredient/add.html.twig');
    }

    /**
     * Delete a specific ingredient
     */
    public function delete(): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $ingredientManager = new IngredientManager();
            $ingredientManager->delete((int)$id);

            header('Location:/ingredients');
        }
    }
}
