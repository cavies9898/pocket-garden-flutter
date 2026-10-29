// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pocket Garden';

  @override
  String get plantsTab => 'Plantas';

  @override
  String get settingsTab => 'Ajustes';

  @override
  String get plantsTitle => 'Mis plantas';

  @override
  String get addPlant => 'Añadir planta';

  @override
  String get retry => 'Reintentar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get save => 'Guardar';

  @override
  String get errorGeneric => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get errorDatabase =>
      'No pudimos acceder a los datos locales de tu jardín.';

  @override
  String get errorStorage =>
      'No pudimos acceder a un archivo de este dispositivo.';

  @override
  String get errorUnexpected => 'Ocurrió un error inesperado.';

  @override
  String get errorCatalog => 'No se pudo cargar el catálogo de plantas.';

  @override
  String get errorSettings => 'No se pudieron guardar tus preferencias.';

  @override
  String get loadingPlants => 'Cargando tus plantas';

  @override
  String get emptyPlantsTitle => 'Tu jardín te espera';

  @override
  String get emptyPlantsBody =>
      'Añade tu primera planta y ten su cuidado siempre a mano.';

  @override
  String get addFirstPlant => 'Añadir mi primera planta';

  @override
  String get plantLocationIndoor => 'Interior';

  @override
  String get plantLocationOutdoor => 'Exterior';

  @override
  String get careGuideTitle => 'Guía de cuidados';

  @override
  String get careWateringTitle => 'Riego';

  @override
  String get careFertilizingTitle => 'Abono';

  @override
  String get careLightTitle => 'Luz';

  @override
  String careEveryDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cada $count días',
      one: 'Cada día',
    );
    return '$_temp0';
  }

  @override
  String get lightLow => 'Poca luz';

  @override
  String get lightMedium => 'Luz media';

  @override
  String get lightBrightIndirect => 'Luz abundante e indirecta';

  @override
  String get lightFullSun => 'Sol directo';

  @override
  String get plantNotesTitle => 'Notas';

  @override
  String plantAddedOn(String date) {
    return 'Añadida el $date';
  }

  @override
  String plantUpdatedOn(String date) {
    return 'Actualizada el $date';
  }

  @override
  String get editPlant => 'Editar planta';

  @override
  String get deletePlant => 'Eliminar planta';

  @override
  String deletePlantTitle(String nickname) {
    return '¿Eliminar $nickname?';
  }

  @override
  String get deletePlantBody =>
      'Se eliminarán la planta, sus notas y su foto de este dispositivo. Esta acción no se puede deshacer.';

  @override
  String plantDeleted(String nickname) {
    return 'Se eliminó $nickname.';
  }

  @override
  String get newPlantTitle => 'Nueva planta';

  @override
  String editPlantTitle(String nickname) {
    return 'Editar $nickname';
  }

  @override
  String get nicknameLabel => 'Apodo';

  @override
  String get nicknameHint => 'p. ej. Monstera del salón';

  @override
  String get speciesLabel => 'Especie';

  @override
  String get speciesHint => 'Elige una especie';

  @override
  String get locationLabel => 'Ubicación';

  @override
  String get notesLabel => 'Notas (opcional)';

  @override
  String get notesHint => 'Luz, tamaño de la maceta, lo que quieras recordar…';

  @override
  String get photoSectionTitle => 'Foto';

  @override
  String get addPhoto => 'Añadir foto';

  @override
  String get changePhoto => 'Cambiar foto';

  @override
  String get removePhoto => 'Quitar foto';

  @override
  String get choosePhotoSourceTitle => 'Añadir una foto de la planta';

  @override
  String get takePhoto => 'Hacer una foto';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

  @override
  String get cameraPermissionTitle => 'Acceso a la cámara';

  @override
  String get cameraPermissionBody =>
      'Pocket Garden usa la cámara solo para fotografiar tu planta. Las fotos se quedan en este dispositivo.';

  @override
  String get cameraPermissionAction => 'Continuar';

  @override
  String get permissionDenied =>
      'Se denegó el acceso a la cámara. Puedes activarlo en los ajustes del sistema o elegir una foto de la galería.';

  @override
  String get photoPickerError => 'No pudimos abrir esa foto. Prueba con otra.';

  @override
  String get validationNicknameRequired => 'Ponle un apodo a tu planta.';

  @override
  String get validationNicknameTooLong =>
      'El apodo debe tener menos de 60 caracteres.';

  @override
  String get validationSpeciesRequired => 'Elige una especie.';

  @override
  String get validationNotesTooLong =>
      'Las notas deben tener menos de 500 caracteres.';

  @override
  String get validationUnknown => 'Revisa este campo.';

  @override
  String get savePlant => 'Guardar planta';

  @override
  String get loadingForm => 'Cargando formulario';

  @override
  String get saving => 'Guardando…';

  @override
  String get plantNotFoundTitle => 'Planta no encontrada';

  @override
  String get plantNotFoundBody =>
      'Puede que se haya eliminado de este dispositivo.';

  @override
  String get backToPlants => 'Volver a mis plantas';

  @override
  String get appearanceTitle => 'Apariencia';

  @override
  String get appearanceSystem => 'Sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Oscuro';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSystem => 'Idioma del sistema';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get localOnlyTitle => 'Privado por diseño';

  @override
  String get localOnlyBody =>
      'Tus plantas, fotos y notas se quedan en este dispositivo. Pocket Garden nunca se conecta a internet.';

  @override
  String get settingsLoading => 'Guardando preferencia…';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsUpdateError => 'No se pudo guardar tu preferencia.';

  @override
  String get startupLoading => 'Preparando tu jardín…';

  @override
  String get startupErrorTitle => 'No se pudo abrir el jardín';

  @override
  String get startupErrorBody =>
      'Tus datos locales están a salvo. Vuelve a abrir la app para intentarlo de nuevo.';

  @override
  String get startupRetry => 'Intentar de nuevo';

  @override
  String plantPhotoSemantics(String nickname) {
    return 'Foto de $nickname';
  }

  @override
  String openPlantSemantics(String nickname, String species, String location) {
    return 'Abrir $nickname, $species, $location';
  }

  @override
  String get optionalLabel => 'Opcional';

  @override
  String get notesEmpty => 'Todavía no hay notas.';

  @override
  String careInfoSemantics(String title, String value) {
    return '$title: $value';
  }

  @override
  String get plantDetailsTitle => 'Detalles de la planta';

  @override
  String get formLoadError => 'No se pudo cargar esta planta en el formulario.';

  @override
  String get formLoadRetry => 'Recargar formulario';

  @override
  String get photoPreviewSemantics => 'Foto seleccionada de la planta';

  @override
  String get settingsSemantics => 'Ajustes de Pocket Garden';

  @override
  String themeModeSemantics(String mode) {
    return 'Tema: $mode';
  }

  @override
  String get routeNotFoundTitle => 'Esta ruta no existe';

  @override
  String get routeNotFoundBody => 'Volvamos a tu jardín.';
}
