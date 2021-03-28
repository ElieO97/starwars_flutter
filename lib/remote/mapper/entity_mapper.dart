/// Interface for model mappers. It provides helper methods that facilitate
/// retrieving of models from outer data source layers
///
/// @param <M> the remote model input type
/// @param <E> the entity model output type
abstract class EntityMapper<M, E> {
  E mapFromRemote(M type);
}
