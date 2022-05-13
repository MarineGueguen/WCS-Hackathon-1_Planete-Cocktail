<?php

namespace App\Controller;

use App\Model\IngredientManager;
use App\Model\RecipeManager;
use App\Model\IngredientRecipeManager;

class RecipeController extends AbstractController
{
    /**
     * List recipes
     */
    public function index(): string
    {
        $recipeManager = new RecipeManager();
        $recipes = $recipeManager->selectAll('title');

        return $this->twig->render('Recipe/index.html.twig', ['recipes' => $recipes]);
    }

    /**
     * Show informations for a specific recipe
     */
    public function show(int $id): string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $id = ($_GET['id']);
        }
        $recipeManager = new RecipeManager();
        $recipe = $recipeManager->selectOneById($id);
        $ingredientRecipeMgr = new IngredientRecipeManager();
        $ingredients = $ingredientRecipeMgr->selectAllIngredientsByRecipeId($id);

        return $this->twig->render('Recipe/show.html.twig', ['recipe' => $recipe, 'ingredients' => $ingredients]);
    }

    public function showRecipesByIngredient(int $id)
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $id = ($_GET['id']);
        }
        $recipeIngredientMgr = new IngredientRecipeManager();
        $ingredientManager = new IngredientManager();
        $recipes = $recipeIngredientMgr->selectAllRecipesByIngredientId($id);
        $ingredient = $ingredientManager->selectOneById($id);

        return $this->twig->render('Recipe/recipes.html.twig', [
            'recipes' => $recipes,
            'ingredient' => $ingredient,
        ]);
    }

    /**
     * Edit a specific recipe
     */
    public function edit(int $id): ?string
    {
        $recipeManager = new RecipeManager();
        $recipe = $recipeManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $recipe = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, update and redirection
            $recipeManager->update($recipe);

            header('Location: /recipes/show?id=' . $id);

            // we are redirecting so we don't want any content rendered
            return null;
        }

        return $this->twig->render('Recipe/edit.html.twig', [
            'recipe' => $recipe,
        ]);
    }

    /**
     * Add a new recipe
     */
    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $recipe = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $recipeManager = new RecipeManager();
            $id = $recipeManager->insert($recipe);

            header('Location:/recipes/show?id=' . $id);
            return null;
        }

        return $this->twig->render('Recipe/add.html.twig');
    }

    /**
     * Delete a specific recipe
     */
    public function delete(): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $recipeManager = new RecipeManager();
            $recipeManager->delete((int)$id);

            header('Location:/recipes');
        }
    }
}
