import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/bases/estilotexto/estilos.dart';
import 'package:flutter_application_1/bases/botones/barraavance.dart';

class Hijos extends StatelessWidget {
  const Hijos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.base,


appBar: AppBar(
  backgroundColor: AppColors.base,
  elevation: 0,

  leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: AppColors.boton1,
    ),
    onPressed: () {},
  ),

  title: Text(
    "Hijos",
    style: TextStyles.quickSemiBold.copyWith(
      color: AppColors.boton1,
    ),
  ),

  centerTitle: true,

  actions: [
    IconButton(
      icon: const Icon(
        Icons.more_vert,
        color: AppColors.negro,
      ),
      onPressed: () {},
    ),
  ],
),
      
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // SALUDO

              Text(
                "Buenos días, David 👋",
                style: TextStyles.quickBold.copyWith(
                  color: AppColors.negro,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "Monitorea a tus hijos en tiempo real",
                style: TextStyles.quickRegularpe.copyWith(
                  color: AppColors.letramensajes,
                ),
              ),

              const SizedBox(height: 25),

              // TARJETA PRINCIPAL

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: AppColors.base,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: AppColors.sombra.withOpacity(0.15),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                 Row(
                    
                 children: [

                 CircleAvatar(
                  radius: 28,
                   backgroundColor: AppColors.datos,

                 child: const Icon(
                  Icons.person,
                 color: AppColors.negro,
                  ),
                  ),

    const SizedBox(width: 12),

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            "Mateo",
            style: TextStyles.quickSemiBold.copyWith(
              color: AppColors.negro,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFF7DFA1),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(
              "Esperando recogida",
              style: TextStyles.montSereg.copyWith(
                color: AppColors.negro,
              ),
            ),
          ),
        ],
      ),
    ),

    Column(
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [

        Text(
          "RECOGIDA",
          style: TextStyles.montSemiBolde.copyWith(
            color: AppColors.letramensajes,
          ),
        ),

        Text(
          "7:00\nAM",
          textAlign: TextAlign.center,

          style: TextStyles.quickSemiBold.copyWith(
            color: AppColors.boton1,
          ),
        ),
      ],
    ),
  ],
 ), const SizedBox(height: 20),

 Container(
  padding: const EdgeInsets.all(15),

  decoration: BoxDecoration(
    color: const Color(0xFFF5F7FA),
    borderRadius: BorderRadius.circular(15),
  ),

  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: [

      Column(
        children: [

          Icon(
            Icons.directions_bus,
            color: AppColors.boton1,
          ),

          const SizedBox(height: 5),

          Text(
            "Ruta asignada",
            style: TextStyles.montSereg.copyWith(
              color: AppColors.letramensajes,
            ),
          ),

          Text(
            "Bus TKS-001",
            style: TextStyles.montSemiBolde.copyWith(
              color: AppColors.negro,
            ),
          ),
        ],
      ),

      Container(
        width: 1,
        height: 50,
        color: Colors.grey.shade300,
      ),

      Column(
        children: [

          Icon(
            Icons.person_outline,
            color: AppColors.boton1,
          ),

          const SizedBox(height: 5),

          Text(
            "Conductor",
            style: TextStyles.montSereg.copyWith(
              color: AppColors.letramensajes,
            ),
          ),

          Text(
            "Ricardo Gómez",
            style: TextStyles.montSemiBolde.copyWith(
              color: AppColors.negro,
            ),
          ),
        ],
      ),
    ],
  ),
), 
  const SizedBox(height: 20),
  Barraavance(),

const SizedBox(height: 5),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: [

    Text(
      "Garaje",
      style: TextStyles.montSereg.copyWith(
        fontSize: 10,
        color: AppColors.boton1,
      ),
    ),

    Text(
      "Tu casa",
      style: TextStyles.montSereg.copyWith(
        fontSize: 10,
        color: AppColors.negro,
      ),
    ),

    Text(
      "Colegio",
      style: TextStyles.montSereg.copyWith(
        fontSize: 10,
        color: AppColors.botondatos,
      ),
    ),
  ],
),

const SizedBox(height: 20),

Row(
  children: [

    Expanded(
      child: Container(
        height: 45,

        decoration: BoxDecoration(
          color: const Color(0xFFE8EBF1),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Center(
          child: Text(
            "Ver ruta",
            style: TextStyles.montSemiBolde.copyWith(
              color: AppColors.boton1,
            ),
          ),
        ),
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      flex: 2,

      child: Container(
        height: 45,

        decoration: BoxDecoration(
          color: AppColors.boton1,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Center(
          child: Text(
            "Entregar niño",
            style: TextStyles.montSemiBolde.copyWith(
              color: AppColors.base,
            ),
          ),
        ),
      ),
    ),
  ],
), 
const SizedBox(height: 35),

         Text(
         "Mis hijos",
         style: TextStyles.quickBold.copyWith(
         color: AppColors.negro,
  ),
),

const SizedBox(height: 5),

Text(
  "Sigue el trayecto escolar en tiempo real.",
  style: TextStyles.quickRegularpe.copyWith(
    color: AppColors.letramensajes,
  ),
),

const SizedBox(height: 20),

Container(
  width: double.infinity,
  padding: const EdgeInsets.all(18),

  decoration: BoxDecoration(
    color: const Color(0xFFF5F7FA),
    borderRadius: BorderRadius.circular(20),
  ),

  child: Row(
    children: [
//hola

      Container(
        width: 45,
        height: 45,

        decoration: BoxDecoration(
          color: AppColors.base,
          borderRadius: BorderRadius.circular(12),
        ),

        child: const Icon(
          Icons.shield_outlined,
          color: AppColors.boton1,
        ),
      ),

      const SizedBox(width: 15),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              "Protocolo de seguridad",
              style: TextStyles.montSemiBolde.copyWith(
                color: AppColors.boton1,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "Recuerda tener listo el código para registrar el abordaje.",
              style: TextStyles.montSereg.copyWith(
                color: AppColors.letramensajes,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}//hola 