import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var textoResp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mostrarAction(_ sender: Any) {
        
        // Paso 1: Preguntamos por permiso
        let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
        }
        
        // Paso 2: Creamos el contenido
        let contenido: UNMutableNotificationContent = UNMutableNotificationContent()
        contenido.title = "El titulo de la notificación"
        contenido.body = "Este es el contenido de la notificación \n Saludos :)"
        contenido.subtitle = "este es un subtitulo"
        contenido.badge = 1
        
        // Paso 3: Hacemos el trigger
        let date: Date = Date().addingTimeInterval(10)
        let dateComponent: DateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let miTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        // Paso 4: crear la peticion
        let id: String = UUID().uuidString
        let request: UNNotificationRequest = UNNotificationRequest(identifier: id, content: contenido, trigger: miTrigger)
        
        // Paso 5: registramos la notificacion en el centro de notificaciones
        center.add(request) { error in
            if error != nil {
                print("Error \(String(describing: error))")
            }
        }
        
    }
    
}

