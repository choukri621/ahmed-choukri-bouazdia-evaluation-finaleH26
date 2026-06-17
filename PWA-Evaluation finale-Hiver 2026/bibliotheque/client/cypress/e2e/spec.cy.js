describe("Mes emprunts", () => {
  it("ouvre la page, remplit le formulaire et soumet", () => {
    cy.visit("http://localhost:5173/emprunts");

    cy.contains("Mes emprunts");

    cy.get("input").type("sophie.martin@biblio.com");

    cy.contains("Voir mes emprunts").click();

    cy.contains("Mes emprunts");
  });
});