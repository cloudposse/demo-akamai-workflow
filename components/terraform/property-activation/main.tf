resource "random_id" "property" {
  keepers = {
    # Generate a new id each time we switch to a new seed
    seed = "${module.this.id}-activation"
  }
  byte_length = 8
}
