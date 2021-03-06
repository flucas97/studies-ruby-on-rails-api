class Contact < ApplicationRecord
    paginates_per 5

    belongs_to :kind
    has_many :phones
    has_one :address
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

=begin
    HTTParty.patch("http://localhost:3000/contacts/107", :body => { "contact": { "name": "Tey", "email": "lucas.feijo@1253.com", "kind_id": "2", "birthdate":"19/07/1997","phones_attributes": [{"number":'9999999'}] }})
     def as_json(options={})
       h = super(options)
       h[:birthdate] =  (I18n.l(self.birthdate) unless self.birthdate.blank?)
       h[:kind] = self.kind.description
       h[:phones] = self.phones.map(&:number)
       h[:street] = self.address.street
       h[:city] = self.address.city
       h
    end


    def translate_birthdate
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: I18n.l(self.birthdate),
        }
    end
    def kind_description
        self.kind.description
    end
=end
  
end
