const app = new Vue({
    el: '#app',
    data: {

        ComboTipoComunes: [],
        descripcion: '',
        Odontologia: {
            OdontologiaID: 0,
            PiezasMalEstado: 0,
            PiezasFaltantes: 0,
            Detalle: '',
            Observaciones: '',
            ListaDiagnosticos: []
        }
    },
    created: async function () {

        await this.obtenerComboComunes();
        await this.init();
        await this.init2();
    },
    methods: {
        create: async function () {

            await axios.post("/Odontologia/Create", {
                _objOdontologia: this.Odontologia,
            }).then(async response => {
                if (response.data.Estado) {
                    Swal.fire(response.data.Descripcion, '', 'success');
                    //window.location.href = "/Contrato/Lista/";
                } else {
                    Swal.fire(response.data.Descripcion, '', 'error');
                }
            }).catch(error => {
                console.log(error);
                Swal.fire('Error al Guardar', 'Intentelo de nuevo', 'error')
            })
                .then(() => {
                });
        },
        AgregarDiagnostico: async function () {

            let enfermedad = '';
            if (this.ComboTipoComunes) {
                this.ComboTipoComunes.forEach(value => {
                    if (value.ComunesID == $('#txtCodigo').val()) {
                        enfermedad = value.Nombre;
                    };
                });
            };

            let Diagnostico = {
                DiagnosticoID: 0,
                OdontologiaID: this.Odontologia.OdontologiaID,
                Codigo: $('#txtCodigo').val(),//codigo de la enfermedad puede ser int o varchar
                Enfermedad: enfermedad,
                Descripcion: this.descripcion,
                Activo: 1
            };

            this.Odontologia.ListaDiagnosticos.push(Diagnostico);
            console.log(this.Odontologia);
        },
        EliminarItemDiagnosticos: async function (index) {

            Swal.fire({
                title: 'Eliminar?',
                text: "Se eliminará el registro!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminar!',
                cancelButtonText: 'No, cancelar!',
            }).then((result) => {
                if (result.value) {

                    this.Odontologia.Diagnosticos[index].Activo = false;

                }
            })
        },
        eventoCheckDiagnostico: async function () {

            //if ($('#chkCodigo').is(':checked')) {
            //    console.log("true");
            //    $("#cod .typeahead").attr('disabled', true);
            //    //$("#txtDescripcion").attr('disabled', true);
            //} else if ($('#chkDescripcion').is(':checked')) {
            //    console.log("false");
            //    //$("#txtDescripcion").attr('disabled', false);
            //    $("#cod .typeahead").attr('disabled', false);
                
            //}
        },
        obtenerComboComunes: async function () {
            await axios.post("/Contrato/ObtenerListaComunes")
                .then(response => {
                    this.ComboTipoComunes = response.data;
                })
                .catch(error => {
                    console.log(error);
                })
                .then(() => {
                });
        },
        init: async function () {

            await this.eventoCheckDiagnostico();
            let scope = this;
            $('.chk').on('change', function () {
                scope.eventoCheckDiagnostico();
            });    

            var id = {};
            var substringMatcher = function (strs) {
                return function findMatches(q, cb) {
                    
                    var matches = [];
                    substrRegex = new RegExp(q, 'i');//'i':flags, no sensible a mayusculas

                    $.each(strs, function (i, str) {
                        if (substrRegex.test(str.Nombre)) { //metodo .test : que verifica una coincidencia en una cadena. Devuelve true o false.
                            matches.push(str.Nombre);
                            id[str.Nombre] = str.ComunesID;
                        }
                    });
                    //console.log(id);
                    cb(matches);
                };
            };

            $('#des .typeahead').bind('typeahead:select', function (ev, suggestion) {
                let prop = suggestion;
                $('#txtCodigo').val(id[prop]);
            });

            $('#txtDescripcion').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            },
                {
                    name: 'states',
                    source: substringMatcher(this.ComboTipoComunes)
                });
        },
        init2: async function () {

            var substringMatcher = function (strs) {
                return function findMatches(q, cb) {
                    var matches = [];                    
                    substrRegex = new RegExp(q, 'i');

                    $.each(strs, function (i, str) {
                        if (substrRegex.test(str.ComunesID)) {
                            matches.push(str);
                        }
                    });

                    cb(matches);
                };
            };

            $('#cod .typeahead').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            },
                {
                    name: 'cities',
                    display: 'ComunesID',
                    source: substringMatcher(this.ComboTipoComunes),
                    templates: {
                        suggestion: function (data) {
                            return '<p><strong>' + data.ComunesID + '</strong> – ' + data.Nombre + '</p>';
                        }
                    }
                });
        }
    }
});