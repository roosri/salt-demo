# Please run the init state first.
# Get the key and secret from a pillar
{% set aws_id = salt['pillar.get']('aws_id') %}
{% set aws_key = salt['pillar.get']('aws_key') %}

# Create the routes
# Public - instances have their own public IP address
white_route_public:
  boto_vpc.route_table_present:
    - name: white_public
    - vpc_name: white
    - subnet_names:
      - white_public
    - routes:
      - destination_cidr_block: 0.0.0.0/0
        internet_gateway_name: white
    - key_id: {{ aws_id }}
    - key: {{ aws_key }}