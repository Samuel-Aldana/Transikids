import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/botones/barraavance.dart';
import 'package:flutter_application_1/bases/botones/paneles.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';
import 'package:flutter_application_1/pantallas/datos.dart';

class Padre extends StatefulWidget {
  final String nombre;
  final VoidCallback? onIrATracking; // Cambiar vista a ruta/tracking

  const Padre({
    super.key,
    required this.nombre,
    this.onIrATracking,
  });

  @override
  State<Padre> createState() => _PadreState();
}

class _PadreState extends State<Padre> {
  late DateTime _horaLlegada;
  final int _segundosTotales = 10 * 60; //10 minutos
  int _segundosRestantes = 10 * 60; // 10 minutos = 600 segundos, cuenta regresiva en segundos
  Timer? _timer;

  @override
  void initState() {
    super.initState();
     _segundosRestantes = _segundosTotales;
    _horaLlegada = DateTime.now().add(const Duration(minutes: 10));// suma 10 minutos a la hora actual(solo se hace 1 vez al iniciar la pantalla) 

   //inicio cuenta regresiva
    _iniciarCuentaRegresiva();
  }
  void _iniciarCuentaRegresiva() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_segundosRestantes > 0) {
        if (mounted) {
          setState(() {
            _segundosRestantes--;
          });//resta los segundos... claramente
        }
      } else {
        _timer?.cancel();
      }
      //al llegar a 0 se apaga
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); //se cancela al salir de la pantalla, o despues toca abrir el administrador de tareas 
    super.dispose();
  }

  // organiza la hora en formato 12 horas con AM/PM
  String _obtenerHoraLlegadaFormateada() {
    final hora12 = _horaLlegada.hour % 12 == 0 ? 12 : _horaLlegada.hour % 12;
    final minutos = _horaLlegada.minute.toString().padLeft(2, '0');
    final periodo = _horaLlegada.hour >= 12 ? 'PM' : 'AM';
    return '${hora12.toString().padLeft(2, '0')}:$minutos $periodo';
  }
  //padleft agrega un 0 a la izquierda si es menor a 10, para que siempre tenga 2 digitos

  // Formato mm:ss para la cuenta regresiva 
  String get _cuentaRegresivaTexto {
    if (_segundosRestantes <= 0) return "00:00";
    final minutos = (_segundosRestantes ~/ 60).toString().padLeft(2, '0');
    final segundos = (_segundosRestantes % 60).toString().padLeft(2, '0');
    return '$minutos:$segundos';
    //convierte los segundos restantes en minutos y segundos, y los organiza de a 2 digitos
  }
  double get _progresoRuta {
    final segundosTranscurridos = _segundosTotales - _segundosRestantes;
    return segundosTranscurridos / _segundosTotales;
    // Calcula qué porcentaje entre 0.0 y 1.0 ha transcurrido
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.base,
      appBar: AppBar(
        backgroundColor: AppColors.base,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.boton1),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Datos()),
          ),
        ),
        title: Text(
          "Inicio",
          style: TextStyles.quickSemiBold.copyWith(
            color: AppColors.boton1,
            fontSize: 20,
          ),
        ),
      ),

      // Botón bot
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: AppColors.boton1,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.smart_toy_outlined,
          color: Colors.white,
          size: 28,
        ),
      ),

      // Contenido principal
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Buenos días, ${widget.nombre} 👋",
                style: TextStyles.quickBold.copyWith(
                  color: AppColors.negro,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Todo está funcionando correctamente",
                style: TextStyles.quickRegularpe.copyWith(
                  color: AppColors.letramensajes,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 25),

              // TARJETA inf.RUTA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.base,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      color: AppColors.negro.withValues(alpha: 0.1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fila de ruta y estado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ruta TKS-001",
                          style: TextStyles.quickBold.copyWith(
                            color: AppColors.ruta,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.btncamino,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "• EN CAMINO",
                            style: TextStyles.quickSemiBold.copyWith(
                              color: AppColors.camino,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Conductor
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 16,
                          color: AppColors.letramensajes,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Conductor: Mario Jiménez",
                          style: TextStyles.montSereg.copyWith(
                            color: AppColors.letramensajes,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Barra de avance + Hora estimada 
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Barraavance(progreso: _progresoRuta)),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "LLEGADA EST.",
                              style: TextStyles.quickRegular.copyWith(
                                color: AppColors.letramensajes,
                                fontSize: 10,
                                letterSpacing: 0.5,
                              ),
                            ),
                            // 10 min+
                            Text(
                              _obtenerHoraLlegadaFormateada(),
                              style: TextStyles.quickBold.copyWith(
                                color: AppColors.boton1,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // paneles
              Row(
                children: [
                  Expanded(
                    child: Panel(
                      icon: Icons.map_outlined,
                      iconColor: AppColors.boton1,
                      iconBgColor: AppColors.btnazul,
                      title: "Ver rutas",
                      onTap: () {
                        widget.onIrATracking?.call(); // Cambia a la vista a tracking
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Panel(
                      icon: Icons.chat_bubble_outline_rounded,
                      iconColor: AppColors.camino,
                      iconBgColor: AppColors.btncamino,
                      title: "Contactar",
                      subtitle: "Chat con conductor",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Panel(
                      icon: Icons.verified_user_outlined,
                      iconColor: AppColors.alerta,
                      iconBgColor: AppColors.btnalerta,
                      title: "Terminos y condiciones",
                      subtitle: "Chequeo de seguridad",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Panel(
                      icon: Icons.history_rounded,
                      iconColor: AppColors.letramensajes,
                      iconBgColor: AppColors.letracampo,
                      title: "Historial",
                      subtitle: "Viajes pasados",
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // notificación de llegada 
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.btncamino,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.camino,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Mensaje que descuenta 
                    Expanded(
                      child: Text(
                        _segundosRestantes > 0
                            ? "Llegada de su hijo a la institución en $_cuentaRegresivaTexto min"
                            : "Su hijo ha llegado a la institución",
                        style: TextStyles.quickSemiBold.copyWith(
                          color: AppColors.camino,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.camino,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}