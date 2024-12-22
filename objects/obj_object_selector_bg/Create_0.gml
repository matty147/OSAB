object_variables = { object_number: object_id };

_object_selector = instance_create_layer(x, y, "objectselector", obj_object_selector, object_variables);

_object_selector.depth = depth - 1; // to appear above the object
