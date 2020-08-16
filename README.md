# Formal-Approaches-to-Software-Engineering

Coursework - Trains! 
 
Abstract. In this coursework, you will have to design a control system for a train powered by nuclear energy. You will then create Ada-SPARK specifications and bodies for your system. Extensions to the given specification are encouraged, and will enable you to gain higher marks. A report, containing your specification definitions and descriptions, must be produced that is no longer than 8-pages in the LNCS style template. These templates are made availabe for you on Moodle. 

1	Overview

In 1954, the Borst atomic train was proposed. It was deemed too expensive to go into production. You will provide a control system for the proposed train, to ensure that it is safe. The train has various subsystems onboard that govern when it can perform certain tasks. For example, the train’s reactor must have at least one control rod inserted at all times; the train must observe a speed limit; new carriages can be added to the train only under certain conditions; and so on. In particular: 

–	The train’s reactor has 5 control rods. The fewer control rods inserted, the more heat and electricity the reactor will generate. 

–	The train’s reactor has a water supply. The higher the supply, the lower the temperature of the reactor. 

–	If the reactor overheats, the train must come to a stop. 

–	There must be a method of taking the reactor offline for maintenance. 

–	New carriages can only be added one at a time, when the train is not moving. – Existing carriages can only be decoupled one at a time. 

–	The maximum available speed of the train at any one time is governed by the electricity the reactor provides and the number of carriages attached. – The train must observe an absolute maximum speed limit. 

1.1 	SPARK levels 

Recall from the lectures and materials online that there are grades of SPARK implementation: 

–	Stone level - valid SPARK 

–	Bronze level - correct initialisation, data and information flow 

–	Silver level - absence of run-time errors 

–	Gold level - proof of key integrity properties 

–	Platinum level - full functional proof of requirements 

Each level subsumes the level below it, in that, for example, one cannot achieve silver without achieving bronze. Normally, these levels are applicable at the program level, but you will be assessed at the subprogram level. For example, your speed system may achieve bronze, but your control rod system may achieve gold. 
