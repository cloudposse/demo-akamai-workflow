resource "random_id" "foo" {
  keepers = {
    # Generate a new id each time we switch to a new seed
    seed = "${module.this.id}-${var.property_name}"
  }
  byte_length = 8
}
