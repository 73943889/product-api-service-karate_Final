@eliminar
Feature: Eliminar un producto usando la API /api/v1/product/
	Background:
    * url 'http://localhost:8080'
    * def ruta_crear = '/api/v1/product/'
		* def result = callonce read('nuevo.feature')
		* print result.response
      
#	Scenario: Eliminar un producto de forma exitosa
#    Given path ruta_crear,"/",result.response.sku,"/"
#    And header Accept = 'application/json'
#    When method delete
#    Then status 200
#    And match responseType == 'json'
#    And match $ == {"count":'#number',"status":true,"message":"El producto fue eliminado con éxito"} 

    Scenario: Eliminar un producto inexistente
    Given path ruta_crear,"/","ff","/"
    And header Accept = 'application/json'
    When method delete
    Then status 400
    And match responseType == 'json'
    And match $ == {"count":'#number',"status":false,"message":"El producto no fue encontrado"}