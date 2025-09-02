class Smartphone:
    def __init__(self, brand, model, storage_gb, battery_mah):
        self.brand = brand
        self.model = model
        self.storage_gb = storage_gb
        self.battery_mah = battery_mah
        self.is_on = False

    def power_on(self):
        if not self.is_on:
            self.is_on = True
            print(f"{self.brand} {self.model} is now ON.")
        else:
            print(f"{self.brand} {self.model} is already ON.")

    def power_off(self):
        if self.is_on:
            self.is_on = False
            print(f"{self.brand} {self.model} is now OFF.")
        else:
            print(f"{self.brand} {self.model} is already OFF.")

    def get_info(self):
        return f"{self.brand} {self.model} - {self.storage_gb}GB, {self.battery_mah}mAh"

# Inheritance: GamingSmartphone extends Smartphone
class GamingSmartphone(Smartphone):
    def __init__(self, brand, model, storage_gb, battery_mah, gpu_model):
        super().__init__(brand, model, storage_gb, battery_mah)
        self.gpu_model = gpu_model

    def get_info(self):
        base_info = super().get_info()
        return f"{base_info}, GPU: {self.gpu_model}"

    def enable_game_mode(self):
        if self.is_on:
            print(f"Game mode enabled on {self.brand} {self.model}!")
        else:
            print(f"Please power on the device to enable game mode.")

if __name__ == "__main__":
    phone = Smartphone("Samsung", "Galaxy S21", 128, 4000)
    gaming_phone = GamingSmartphone("Asus", "ROG Phone 5", 256, 6000, "Adreno 660")

    print(phone.get_info())
    phone.power_on()
    phone.power_off()

    print(gaming_phone.get_info())
    gaming_phone.power_on()
    gaming_phone.enable_game_mode()