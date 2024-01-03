<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Matiere</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div align="right" class="container pt-4 ps-2 pe-2">
        <!-- Add any content you need at the top of the page -->
    </div>
    <div class="container pt-4 ps-2 pe-2">
        <h1>Edit Matiere</h1>
        <form method="POST" action="UpdateMatiere">
            <div class="mb-3">
                <input type="hidden" name="id" value="${id}" />
                <label for="nom_matiere" class="form-label">Nom Matiere:</label>
                <input type="text" name="nom_matiere" value="${nom_matiere}" class="form-control" required />
            </div>
            <div class="mb-3">
                <label for="note_ds" class="form-label">Note DS:</label>
                <input type="number" name="note_ds" value="${note_ds}" class="form-control" required />
            </div>
            <div class="mb-3">
                <label for="note_examen" class="form-label">Note Examen:</label>
                <input type="number" name="note_examen" value="${note_examen}" class="form-control" required />
            </div>
			<div class="mb-3">
    			<label for="moyen" class="form-label">Moyen:</label>
    			<input type="number" name="moyen" value="${moyen}" class="form-control" readonly />
			</div>

            <div class="mb-3">
                <label for="etudiant_id" class="form-label">Etudiant ID:</label>
                <input type="text" name="etudiant_id" value="${etudiant_id}" class="form-control" required />
            </div>
            <!-- Add more input fields for other matiere attributes -->
            <div class="mb-3">
                <label for="etudiant_id" class="form-label">Enseignant ID:</label>
                <input type="text" name="enseignant_id" value="${enseignant_id}" class="form-control" required />
            </div>
            <input type="submit" value="Update" class="btn btn-primary" />
            <a href="index.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    <!-- Add any additional content you need at the bottom of the page -->
</body>
</html>
