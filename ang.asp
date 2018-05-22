<!-- #include file="top.asp" -->
<script src="assets/js/angular.min.js"></script>
<body ng-app="adventureModule">
	<div ng-controller="personCtrl" class="container-fluid">
		<table ng-cloak class="pure-table">
			<thead>
				<tr>
					<th hidden="hidden">Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
					<th>Gender</th>
					<th>City</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="item in personData">
					<td style="display:none">{{item.Id}}</td>
					<td>{{item.FirstName}}</td>
					<td>{{item.LastName}}</td>
					<td>{{item.Age}}</td>
					<td>{{item.Gender}}</td>
					<td>{{item.City}}</td>
					<td>
						<button ng-model="$scope.Person" ng-click="edit(personData[$index])" class="pure-button pure-button-primary">Edit</button>
						<button ng-click="delete($index)" class="pure-button pure-button-primary">Delete</button>
					</td>
				</tr>
			</tbody>
		</table>
		<br />
		<div>
			<button ng-click="addnewdiv=true" class="pure-button pure-button-primary">Add Person</button>
		</div>
		
		<div ng-show="addnewdiv" class="pure-form">
			<div>
				<label for="firstname" class="pure-u-1-8">First Name</label>
				<input type="text" data-ng-model="Person.FirstName" />
			</div>
			<div>
				<label for="lastname"  class="pure-u-1-8">Last Name</label>
				<input type="text" data-ng-model="Person.LastName" />
			</div>
			<div>
				<label for="age"  class="pure-u-1-8">Age</label>
				<input type="text" data-ng-model="Person.Age" />
			</div>
			<div>
				<label for="gender"  class="pure-u-1-8">Gender</label>
				<input type="text" data-ng-model="Person.Gender" />
			</div>
			<div>
				<label for="gender"  class="pure-u-1-8">City</label>
				<input type="text" data-ng-model="Person.City" />
			</div>
			<div>
				<button data-ng-click="save()" class="pure-button pure-button-primary">Save</button>
				<button data-ng-click="clear()" class="pure-button pure-button-primary">Cancel</button>
			</div>
		</div>
		<div ng-show="updatediv" class="pure-form">
			<div hidden="hidden">
				<label for="Id" class="pure-u-1-8">Id</label>
				<input type="text" data-ng-model="Person.Id" />
			</div>
			<div>
				<label for="firstname" class="pure-u-1-8">First Name</label>
				<input type="text" data-ng-model="Person.FirstName" />
			</div>
			<div>
				<label for="lastname" class="pure-u-1-8">Last Name</label>
				<input type="text" data-ng-model="Person.LastName" />
			</div>
			<div>
				<label for="age" class="pure-u-1-8">Age</label>
				<input type="text" data-ng-model="Person.Age" />
			</div>
			<div>
				<label for="gender" class="pure-u-1-8">Gender</label>
				<input type="text" data-ng-model="Person.Gender" />
			</div>
			<div>
				<label for="gender" class="pure-u-1-8">City</label>
				<input type="text" data-ng-model="Person.City" />
			</div>
			<div>
				<button data-ng-click="update()" class="pure-button pure-button-primary">Update</button>
				<button data-ng-click="clear()" class="pure-button pure-button-primary">Cancel</button>
			</div>
		</div>
	</div>
<script>
var app = angular.module('adventureModule', []);

app.factory('personService', function ($http) {

    var factory = {};

    factory.getallrecords = function () {

        return $http.get('api/Person/GetAllPersons');

    }

    return factory;

});

Then we have to create AngularJS controller to perform CRUD operation. Right click “Scripts” folder to add new javascript file “Person.cs”  and copy the following code.

/// <reference path="angular.js" />

/// <reference path="App.js" />

 

app.controller('personCtrl', function ($scope, $http, personService) {

 

    $scope.personData = null;

    personService.getallrecords().then(function (d) {

        $scope.personData = d.data;

    }, function (response) {

        alert('error occurred'+response.data.ExceptionMesage);

    });

 

    $scope.Person = {

        Id: '',

        FirstName: '',

        LastName: '',

        Age: '',

        Gender: '',

        City: ''

    };

 

    $scope.clear = function () {

        $scope.Person.Id = '',

        $scope.Person.FirstName = '',

        $scope.Person.LastName = '',

        $scope.Person.Age = '',

        $scope.Person.Gender = '',

        $scope.Person.City = ''

        $scope.addnewdiv = false;

        $scope.updatediv = false;

    };

    //Add new record

 

    $scope.save = function () {

        if ($scope.Person.FirstName != '' && $scope.Person.LastName != '' && $scope.Person.Age != '' && $scope.Person.Gender != '' && $scope.Person.City != '') {

            $http({

                method: 'POST',

                url: 'api/Person/AddPerson',

                data: $scope.Person

 

            }).then(function successCallback(response) {

                $scope.personData.push(response.data);

                $scope.clear();

                alert('Inserted successfully!!');

                $scope.addnewdiv = false;

            }, function errorCallback(response) {

 

                alert('error:' + response.data.ExceptionMesage);

            });

        }

        else {

            alert('Please enter all the values!!');

        }

 

    };

 

    //Edit records

    $scope.edit = function (data) {    

        $scope.Person = { Id: data.Id, FirstName: data.FirstName, LastName: data.LastName, Age: data.Age, Gender: data.Gender, City: data.City }

        $scope.updatediv = true;

    };

 

    //Cancel record

 

    $scope.cancel = function () {

        $scope.clear();

    };

 

    //Update record

    $scope.update = function () {

        if ($scope.Person.FirstName != '' && $scope.Person.LastName != '' && $scope.Person.Age != '' && $scope.Person.Gender != '' && $scope.Person.City != '') {

            $http({

                method: 'PUT',

                url: 'api/Person/UpdatePerson/' + $scope.Person.Id,

                data: $scope.Person

 

            }).then(function successCallback(response) {

                $scope.personData = response.data;

                $scope.clear();

                alert('Updated successfully!!');

                $scope.updatediv = false;

            }, function errorCallback(response) {

 

                alert('error:' + response.data.ExceptionMesage);

            });

        }

        else {

            alert('Please enter all the values!!');

        }

    };

 

    //Delete record

    $scope.delete = function (index) {

        $http({

            method: 'DELETE',

            url: 'api/Person/DeletePerson/' + $scope.personData[index].Id,

 

        }).then(function successCallback(response) {

            $scope.personData.splice(index, 1);

            alert('Record deleted successfully');

        }, function failureCallback(response) {

            alert('error:' + response.data.ExceptionMesage)

        });

 

    };

});

 
</script>
<!-- #include file="footer.asp" -->