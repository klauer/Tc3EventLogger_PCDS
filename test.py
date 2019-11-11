plc = project.plcs_by_name['Listener']
event_severity = plc.tmc.get_data_type('TcEventSeverity')
symbols = {sym.name: sym for sym in plc.find(Symbol)}
sym = symbols['MAIN.fbListenerTest']
for item in sym.walk():
    if 'severity' in str(item).lower():
        print('\n', item)
