# Weather App

### Points to be mentioned

 • App is built using Swift 5.0 and Xcode 14.0
 
 • Design Pattern: MVVM-C with clean Architecture
 
 • No Storyboards are used, UI is coded. [Yeah, no Main.storyboard, Except launchscreen.storyboard].
 
 •  [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing) library is used 
 
 • Minimum deployment target iOS 15.0

### Folder Structure

#### Top level folder structure consists of 

- [x] Application

     Consists of Application level delegates like AppDelegate and SceneDelegate, also Application level coordinator
- [x] SupportFiles

     Consists of Application support files like Assets, Plist, Configurations 
- [x] Storyboards

     Consists of Storyboards, in this case only Launchscreen.storyboard
- [x] Source

     Here you can find the full source code which is further classifed to different layers according to clean architecture:

     - [x] Presentation
     
          All modules each with their own view model, views and coordinators 
           
     - [x] Data
     
          Repositories Implementations + API (Network)
           
     - [x] Domain
     
          Entities + Use Cases + Repositories Interfaces

     More info about Clean Architecture can be found [here](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

 In Presentation layer I have modularaised them based on module name. In this case we have only one module named `WeatherScene` which contains below folder structure
      
  - [x] Controllers
         Consists of `UIViewController` files of a module
           
  - [x] Coordinators
         Responsible to handle all the routings and initial setuping of controller. In this project we have a Base coordinator `WeatherCoordinator` 
         and all module level coordinators will be confirming to this.

         ```swift
          protocol WeatherCoordinator {
             func start()
             func coordinate(to coordinator: WeatherCoordinator)
          } 
         ```
         
  - [x] View Models
         View Models of module
     
  - [x] Helper
         All the helpers like protocols and enum responsible for the module


### Network Layer
  In app networking is done inside the presentation layer under `Infrastructure`

  • Network layer consist of 
  
  - [x] Helper
  
      Consists of all helper operations like Protocols, Enums related to network layer 
  - [x] Configurations

      Consists of NetworkConfiguration file to get base url from Configuration Plist
  - [x] Router

      Router files respective to modules, which creates a URLRequest with all properties and give to Network Manager
      
  - [x] EndPoints

      Consists of all EndPoints of URL for each network calls
      
  - [x] Client

      Heart of Network layer where the actual network calls to server happens 
      
  

 
### App Implementaion

  • Application is built by following MVVM-C Pattern with clean Architecture, which helps to achieve testable, reusable and mainatainable code
  
  • Application has a simple view which show current basic weather info
  
  • Loaders(activity indicators) will be shown during network call
  
  • Unit test cases are written for ViewModel, Network layer and other business logics
  
  • Snapshot testing has be done for Views
  
  • Errors are shown to UI though UIAlert
  
