export interface RegistrationPayload {
  // Personal
  first_name:    string;
  last_name:     string;
  email:         string;
  phone?:        string;
  date_of_birth?: string;

  // Residential Address
  res_city?:  string;
  res_street?:    string;
  res_erf?:   string;
  res_country?: string;

  // Postal Address
  postal_address?:  string;
  postal_city?:    string;
  postal_country?: string;
}