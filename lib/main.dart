import 'dart:convert';
import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(const ChronicleRpg());
const ink = Color(0xFF171923);
const panel = Color(0xFF242938);
const gold = Color(0xFFE0B35B);
class ChronicleRpg extends StatelessWidget {
  const ChronicleRpg( {
    super.key
  }
  );
  @override
  Widget build(BuildContext context) => MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'حياة اسيكاي',
  theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: ink,
  colorScheme: ColorScheme.fromSeed(seedColor: gold,
  brightness: Brightness.dark),
  cardColor: panel,
  appBarTheme: const AppBarTheme(backgroundColor: ink,
  foregroundColor: gold),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: gold,
  foregroundColor: ink,
  padding: const EdgeInsets.symmetric(vertical: 12,
  horizontal: 14))),
  ),
  home: const SaveMenu(),
  );
}
final Random rng = Random();
int max(int a,
int b) => a > b ? a : b;
int min(int a,
int b) => a < b ? a : b;
String pick(List<String> values) => values[rng.nextInt(values.length)];
int roll(int max) => rng.nextInt(max) + 1;
const firstNamesM = ['آدم',
'سليم',
'نادر',
'مالك',
'ريان',
'فارس',
'إياد',
'سامر',
'قيس',
'عاصم',
'يزن',
'رامي',
'جاسر',
'مراد',
'ليث',
'هاشم',
'باسل',
'نديم',
'تيم',
'زاهر'];
const firstNamesF = ['ليان',
'ميرا',
'سلمى',
'تالا',
'نور',
'رُبى',
'يارا',
'جمانة',
'هالة',
'ديمة',
'سيرين',
'رنا',
'لورا',
'ميس',
'آسية',
'رند',
'لمى',
'نيروز',
'سارة',
'أروى'];
const surnames = ['الرمادي',
'الحداد',
'ابن الوادي',
'السالمي',
'النجّار',
'الورّاق',
'الأسمر',
'الرحّال',
'المرجان',
'الصفّار',
'الغيوم',
'الكرمي',
'الضاري',
'الزهراني',
'المنسي'];
const races = ['إنسان',
'قزم جبلي',
'إلف غابة',
'نصف أوركي',
'دم مختلط'];
const classes = ['مغامر متدرّب',
'مبارز',
'حارس',
'رامٍ',
'محتال',
'ساحر مبتدئ',
'معالج',
'صياد وحوش',
'رحّالة'];
const skills = ['ضربة مركّزة',
'مراوغة',
'عين الصياد',
'إسعاف أولي',
'تعويذة شرر',
'جلد صلب',
'مساومة',
'خطوة صامتة',
'ضربة مضادة',
'تركيز سحري',
'حدس الطريق',
'رمي دقيق'];
const locations = ['قرية الصفصاف',
'طريق الطاحونة',
'غابة الضباب',
'مجرى النهر',
'أطلال الحراس',
'مدينة أرين',
'سوق النحاسين',
'نقابة المغامرين',
'حانة المصباح الأزرق',
'معبد الفجر',
'مقبرة التلال',
'منجم الحديد',
'كهف العظام',
'جسر الملك القديم',
'مستنقع الغراب',
'مرتفعات الصقيع',
'ميناء المرجان',
'جزيرة المنفى',
'برج الساحر',
'قلعة الرماد',
'صحراء الزجاج',
'واحة القمر',
'غابة الفطر',
'سراديب المدينة',
'مكتبة الأختام',
'ساحة التدريب',
'حديقة الأعشاب',
'مزرعة الحبوب',
'ممر القوافل',
'مخيم الصيادين',
'كهف البلور',
'وادي التنانين',
'بوابة الشمال',
'قرية الصيادين',
'مقر الحرس',
'قصر الحاكم'];
const monsters = [
['جرذ كهفي',
8,
2,
5,
4],
['ذئب جائع',
12,
3,
7,
7],
['لص طريق',
15,
4,
10,
9],
['عنكبوت سام',
11,
3,
8,
8],
['هيكل عظمي',
18,
4,
12,
12],
['غول صغير',
24,
5,
15,
15],
['خفاش دموي',
14,
4,
9,
9],
['سحلية شوكية',
20,
5,
12,
13],
['روح هائمة',
19,
5,
14,
15],
['كلب رماد',
22,
6,
15,
16],
['قاطع طريق',
25,
6,
18,
18],
['حارس أطلال',
30,
7,
20,
23],
['نبات مفترس',
28,
6,
18,
20],
['ضفدع مستنقع',
24,
6,
16,
18],
['غراب عملاق',
26,
7,
18,
20],
['مقلّد صندوق',
34,
8,
22,
28],
['مستذئب',
40,
9,
27,
32],
['فارس ميت',
42,
9,
29,
35],
['ساحر منفي',
38,
10,
32,
38],
['دب جبلي',
45,
10,
28,
35],
['عقرب زجاجي',
39,
9,
29,
34],
['وحش الكهف',
52,
11,
35,
42],
['غول مدرع',
60,
12,
40,
50],
['شبح نبيل',
48,
12,
40,
48],
['تنين يافع',
75,
14,
55,
75],
['حارس البلور',
68,
13,
48,
65],
['شيطان الرماد',
82,
15,
60,
85],
['تنين قديم',
130,
19,
100,
160]
];
class Hero {
  String name,
  gender,
  race,
  role,
  location,
  weather,
  timeOfDay;
  int age,
  day,
  hour,
  hp,
  maxHp,
  mp,
  maxMp,
  stamina,
  maxStamina,
  strength,
  agility,
  intelligence,
  charisma,
  luck,
  level,
  xp,
  goldCoins,
  reputation,
  hunger,
  thirst,
  wounds,
  kills,
  daysPlayed;
  List<String> skills,
  inventory,
  quests,
  completedQuests,
  relationships,
  flags,
  journal;
  Map<String,
  int> equipment;
  Hero( {
    required this.name,
    required this.gender,
    this.race='إنسان',
    this.role='مغامر متدرّب',
    this.location='قرية الصفصاف',
    this.weather='صافٍ',
    this.timeOfDay='صباح',
    this.age=12,
    this.day=1,
    this.hour=8,
    this.hp=35,
    this.maxHp=35,
    this.mp=12,
    this.maxMp=12,
    this.stamina=20,
    this.maxStamina=20,
    this.strength=5,
    this.agility=5,
    this.intelligence=5,
    this.charisma=5,
    this.luck=5,
    this.level=1,
    this.xp=0,
    this.goldCoins=8,
    this.reputation=0,
    this.hunger=10,
    this.thirst=10,
    this.wounds=0,
    this.kills=0,
    this.daysPlayed=0,
    List<String>? skills,
    List<String>? inventory,
    List<String>? quests,
    List<String>? completedQuests,
    List<String>? relationships,
    List<String>? flags,
    List<String>? journal,
    Map<String,
    int>? equipment
  }
  )
  : skills=skills??[],
  inventory=inventory??['خبز يابس',
  'قميص متشقّق',
  'بنطال مرقّع'],
  quests=quests??[],
  completedQuests=completedQuests??[],
  relationships=relationships??[],
  flags=flags??[],
  journal=journal??[],
  equipment=equipment?? {
    'سلاح':0,
    'درع':0
  }
  ;
  int get attack => strength + level + (equipment['سلاح']??0) + (skills.contains('ضربة مركّزة')?2:0);
  int get defense => (equipment['درع']??0) + (skills.contains('جلد صلب')?2:0);
  Map<String,
  dynamic> toJson()=> {
    'name':name,
    'gender':gender,
    'race':race,
    'role':role,
    'location':location,
    'weather':weather,
    'timeOfDay':timeOfDay,
    'age':age,
    'day':day,
    'hour':hour,
    'hp':hp,
    'maxHp':maxHp,
    'mp':mp,
    'maxMp':maxMp,
    'stamina':stamina,
    'maxStamina':maxStamina,
    'strength':strength,
    'agility':agility,
    'intelligence':intelligence,
    'charisma':charisma,
    'luck':luck,
    'level':level,
    'xp':xp,
    'goldCoins':goldCoins,
    'reputation':reputation,
    'hunger':hunger,
    'thirst':thirst,
    'wounds':wounds,
    'kills':kills,
    'daysPlayed':daysPlayed,
    'skills':skills,
    'inventory':inventory,
    'quests':quests,
    'completedQuests':completedQuests,
    'relationships':relationships,
    'flags':flags,
    'journal':journal,
    'equipment':equipment
  }
  ;
  factory Hero.fromJson(Map<String,
  dynamic> j)=>Hero(name:j['name']??'رحّال',
  gender:j['gender']??'ذكر',
  race:j['race']??'إنسان',
  role:j['role']??'مغامر متدرّب',
  location:j['location']??'قرية الصفصاف',
  weather:j['weather']??'صافٍ',
  timeOfDay:j['timeOfDay']??'صباح',
  age:j['age']??12,
  day:j['day']??1,
  hour:j['hour']??8,
  hp:j['hp']??35,
  maxHp:j['maxHp']??35,
  mp:j['mp']??12,
  maxMp:j['maxMp']??12,
  stamina:j['stamina']??20,
  maxStamina:j['maxStamina']??20,
  strength:j['strength']??5,
  agility:j['agility']??5,
  intelligence:j['intelligence']??5,
  charisma:j['charisma']??5,
  luck:j['luck']??5,
  level:j['level']??1,
  xp:j['xp']??0,
  goldCoins:j['goldCoins']??8,
  reputation:j['reputation']??0,
  hunger:j['hunger']??10,
  thirst:j['thirst']??10,
  wounds:j['wounds']??0,
  kills:j['kills']??0,
  daysPlayed:j['daysPlayed']??0,
  skills:List<String>.from(j['skills']??[]),
  inventory:List<String>.from(j['inventory']??[]),
  quests:List<String>.from(j['quests']??[]),
  completedQuests:List<String>.from(j['completedQuests']??[]),
  relationships:List<String>.from(j['relationships']??[]),
  flags:List<String>.from(j['flags']??[]),
  journal:List<String>.from(j['journal']??[]),
  equipment:Map<String,
  int>.from((j['equipment']?? {
    'سلاح':0,
    'درع':0
  }
  ).map((k,
  v)=>MapEntry(k,
  (v as num).toInt()))));
}
class SaveMenu extends StatefulWidget {
  const SaveMenu( {
    super.key
  }
  );
  @override State<SaveMenu> createState()=>_SaveMenuState();
}
class _SaveMenuState extends State<SaveMenu> {
  List<Hero?> slots=[null,
  null,
  null];
  bool loading=true;
  @override void initState() {
    super.initState();
    _loadSlots();
  }
  Future<void> _loadSlots() async {
    final p=await SharedPreferences.getInstance();
    for(int i=0; i<3; i++) {
      final s=p.getString('chronicle_slot_$i');
      if(s!=null) {
        try {
          slots[i]=Hero.fromJson(jsonDecode(s));
        }
        catch(_) {
        }
      }
    }
    if(mounted)setState(()=>loading=false);
  }
  Future<void> _delete(int i) async {
    final p=await SharedPreferences.getInstance();
    await p.remove('chronicle_slot_$i');
    setState(()=>slots[i]=null);
  }
  void _open(int i) {
    if(slots[i]!=null) {
      Navigator.push(context,
      MaterialPageRoute(builder:(_)=>GameScreen(hero:slots[i]!,
      slot:i)));
    }
    else {
      Navigator.push(context,
      MaterialPageRoute(builder:(_)=>NewHeroScreen(onCreate:(h) {
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(_)=>GameScreen(hero:h,
        slot:i)));
      }
      )));
    }
  }
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('حكايات الطريق')),
  body:loading?const Center(child:CircularProgressIndicator()):ListView(padding:const EdgeInsets.all(18),
  children:[const Text('رحلة لا يكتبها أحد سواك',
  style:TextStyle(fontSize:24,
  fontWeight:FontWeight.bold,
  color:gold),
  textAlign:TextAlign.center),
  const SizedBox(height:8),
  const Text('قصة تفاعلية تحفظ اختياراتك محلياً على الجهاز.',
  textAlign:TextAlign.center),
  const SizedBox(height:24),
  ...List.generate(3,
  (i)=>Card(child:ListTile(contentPadding:const EdgeInsets.all(12),
  leading:CircleAvatar(backgroundColor:gold,
  foregroundColor:ink,
  child:Text('${i+1}')),
  title:Text(slots[i]?.name??'خانة حفظ ${i+1}'),
  subtitle:Text(slots[i]==null?'فارغة': 'العمر ${slots[i]!.age} سنة • المستوى ${slots[i]!.level}\n${slots[i]!.location} • ${slots[i]!.goldCoins} قطعة ذهب'),
  isThreeLine:slots[i]!=null,
  onTap:()=>_open(i),
  trailing:slots[i]==null?const Icon(Icons.add):PopupMenuButton<String>(onSelected:(v) {
    if(v=='delete')_delete(i);
    if(v=='load')_open(i);
  }
  ,
  itemBuilder:(_)=>[const PopupMenuItem(value:'load',
  child:Text('متابعة')),
  const PopupMenuItem(value:'delete',
  child:Text('حذف الحفظ'))])))),
  const SizedBox(height:20),
  const Text('ملاحظة: الأحداث والقتال والموارد تتغير بحسب الإحصائيات والاختيارات.',
  textAlign:TextAlign.center,
  style:TextStyle(color:Colors.white60))]));
}
class NewHeroScreen extends StatefulWidget {
  final void Function(Hero) onCreate;
  const NewHeroScreen( {
    super.key,
    required this.onCreate
  }
  );
  @override State<NewHeroScreen> createState()=>_NewHeroScreenState();
}
class _NewHeroScreenState extends State<NewHeroScreen> {
  final nameCtrl=TextEditingController();
  String gender='ذكر';
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('بداية الحكاية')),
  body:ListView(padding:const EdgeInsets.all(20),
  children:[const Text('أنت في الثانية عشرة من عمرك. لا تملك سوى ملابس متشققة وبعض القطع النقدية.',
  style:TextStyle(fontSize:17,
  height:1.7)),
  const SizedBox(height:22),
  TextField(controller:nameCtrl,
  decoration:const InputDecoration(labelText:'اسم الشخصية',
  border:OutlineInputBorder(),
  hintText:'اكتب اسماً')),
  const SizedBox(height:18),
  const Text('الجنس'),
  RadioListTile(value:'ذكر',
  groupValue:gender,
  title:const Text('ذكر'),
  onChanged:(v)=>setState(()=>gender=v!)),
  RadioListTile(value:'أنثى',
  groupValue:gender,
  title:const Text('أنثى'),
  onChanged:(v)=>setState(()=>gender=v!)),
  const SizedBox(height:20),
  ElevatedButton(onPressed:() {
    final name=nameCtrl.text.trim().isEmpty?pick(gender=='ذكر'?firstNamesM:firstNamesF):nameCtrl.text.trim();
    final h=Hero(name:name,
    gender:gender,
    race:pick(races),
    role:pick(classes),
    strength:3+roll(5),
    agility:3+roll(5),
    intelligence:3+roll(5),
    charisma:3+roll(5),
    luck:3+roll(5),
    hp:28+roll(12),
    maxHp:28+roll(12),
    mp:8+roll(12),
    maxMp:8+roll(12),
    skills:[pick(skills)],
    inventory:['خبز يابس',
    'قميص متشقّق',
    'بنطال مرقّع',
    'قارورة ماء']);
    h.maxHp=h.hp;
    h.maxMp=h.mp;
    h.journal.add('اليوم الأول: بدأت حياة $name في قرية الصفصاف.');
    widget.onCreate(h);
  }
  ,
  child:const Text('ابدأ الرحلة'))]));
}
class GameScreen extends StatefulWidget {
  final Hero hero;
  final int slot;
  const GameScreen( {
    super.key,
    required this.hero,
    required this.slot
  }
  );
  @override State<GameScreen> createState()=>_GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  late Hero h;
  String story='';
  List<Choice> choices=[];
  bool busy=false;
  @override void initState() {
    super.initState();
    h=widget.hero;
    _event('start');
  }
  Future<void> _save()async {
    final p=await SharedPreferences.getInstance();
    await p.setString('chronicle_slot_${widget.slot}',
    jsonEncode(h.toJson()));
    if(mounted)ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('تم حفظ الرحلة')));
  }
  void _log(String s) {
    h.journal.add('اليوم ${h.day}، ${h.hour}:00 — $s');
    if(h.journal.length>120)h.journal.removeAt(0);
  }
  void _advance([int hours=1]) {
    for(int i=0; i<hours; i++) {
      h.hour++;
      if(h.hour>=24) {
        h.hour=0;
        h.day++;
        h.daysPlayed++;
        h.hunger=(h.hunger+12).clamp(0,
        100).toInt();
        h.thirst=(h.thirst+15).clamp(0,
        100).toInt();
        if(h.day%365==0)h.age++;
        if(rng.nextInt(4)==0)h.weather=pick(['صافٍ',
        'غائم',
        'ممطر',
        'ضباب كثيف',
        'عاصفة']);
        if(h.hunger>=80||h.thirst>=85) {
          h.hp=max(1,
          h.hp-2);
        }
      }
    }
    h.timeOfDay=h.hour<5?'ليل متأخر':h.hour<8?'فجر':h.hour<12?'صباح':h.hour<17?'ظهيرة':h.hour<20?'مساء':'ليل';
  }
  void _event(String id) {
    setState(() {
      switch(id) {
        case 'start':story='تستيقظ في غرفة ضيقة عند طرف قرية الصفصاف. الريح تتسلل من شقوق النافذة، وثيابك المتشققة لا تحميك كثيراً من البرد. لا عائلة ثرية تنتظرك، ولا نبوءة اختارتك. أمامك يوم عادي يمكن أن يصنع بداية مختلفة.';
        choices=[Choice('الخروج إلى ساحة القرية',
        ()=>_event('village')),
        Choice('تفقد جيوبك وأغراضك',
        ()=>_event('pockets')),
        Choice('مساعدة الجارة في حمل الحطب',
        ()=>_event('neighbor'))];
        break;
        case 'pockets':story='تجد ثماني قطع نحاسية، خبزاً يابساً وقارورة ماء شبه فارغة. في جيب داخلي ورقة قديمة عليها ختم نقابة المغامرين.';
        choices=[Choice('قراءة الورقة',
        () {
          _log('وجدت ورقة تحمل ختم النقابة.');
          h.flags.add('guild_letter');
          _event('village');
        }
        ),
        Choice('الاحتفاظ بها والخروج',
        ()=>_event('village'))];
        break;
        case 'neighbor':story='الجارة مريم، امرأة في أواخر الأربعينيات، تراك تحمل الحطب بصعوبة. تشكرك وتقدم لك وجبة بسيطة. «لا تجعل الجوع يقرر عنك»، تقول.';
        choices=[Choice('قبول الطعام',
        () {
          h.hunger=max(0,
          h.hunger-30);
          h.hp=min(h.maxHp,
          h.hp+3);
          h.relationships.add('مريم: ودّ');
          h.inventory.add('وجبة منزلية');
          _log('ساعدت مريم وكسبت ثقتها.');
          _advance();
          _event('village');
        }
        ),
        Choice('رفض الطعام بأدب',
        () {
          h.charisma++;
          _advance();
          _event('village');
        }
        )];
        break;
        case 'village':story='ساحة القرية تستيقظ ببطء. حداد يدعى جابر يفتح ورشته، وفتاة تجمع الأعشاب قرب البئر، بينما يعلّق رسول ورقة على لوحة خشبية. إلى الغرب طريق الطاحونة، وإلى الشرق غابة الضباب.';
        choices=[Choice('التحدث إلى جابر الحداد',
        ()=>_event('smith')),
        Choice('التحدث إلى الفتاة نيرين',
        ()=>_event('herbalist')),
        Choice('قراءة لوحة الإعلانات',
        ()=>_event('board')),
        Choice('التوجه إلى طريق الطاحونة',
        ()=>_travel('طريق الطاحونة')),
        Choice('دخول غابة الضباب',
        ()=>_travel('غابة الضباب')),
        Choice('الذهاب إلى النقابة في مدينة أرين',
        ()=>_travel('نقابة المغامرين')),
        Choice('الراحة في غرفتك',
        ()=>_event('rest'))];
        break;
        case 'smith':story='يمسح جابر يديه بقطعة قماش. «السيف الجيد أغلى مما تملك، لكنني أستطيع إصلاح أداة أو تعليمك كيف تمسك سلاحاً».';
        choices=[Choice('التدرب على أساسيات القتال (3 ذهب)',
        () {
          if(h.goldCoins>=3) {
            h.goldCoins-=3;
            h.strength++;
            h.stamina=max(0,
            h.stamina-4);
            _log('تدربت عند جابر واكتسبت قوة.');
          }
          else story='لا تملك ما يكفي. يعرض جابر تدريباً مجانياً إن ساعدته في ترتيب الورشة غداً.';
          _advance(2);
          _refresh();
        }
        ),
        Choice('شراء سكين مستعمل (6 ذهب)',
        () {
          if(h.goldCoins>=6) {
            h.goldCoins-=6;
            h.inventory.add('سكين مستعمل');
            h.equipment['سلاح']=2;
            _log('اشتريت سكيناً مستعملاً.');
          }
          else story='يعتذر جابر: لا يمكنه منحك السكين مجاناً.';
          _refresh();
        }
        ),
        Choice('العودة للساحة',
        ()=>_event('village'))];
        break;
        case 'herbalist':story='تعرّف الفتاة نفسها باسم نيرين. تحمل سلة من أوراق النعناع واليارو. «الغابة ليست آمنة بعد الغروب. إن وجدت ثلاث أوراق فضية فسأعطيك مرهماً».';
        choices=[Choice('قبول مهمة الأعشاب',
        () {
          if(!h.quests.contains('أعشاب نيرين'))h.quests.add('أعشاب نيرين');
          _log('قبلت مهمة جمع الأعشاب الفضية.');
          _travel('غابة الضباب');
        }
        ),
        Choice('شراء جرعة علاج (5 ذهب)',
        () {
          if(h.goldCoins>=5) {
            h.goldCoins-=5;
            h.inventory.add('جرعة علاج');
          }
          else story='لا تملك خمسة قطع ذهبية.';
          _refresh();
        }
        ),
        Choice('سؤالها عن الغابة',
        () {
          h.intelligence++;
          story='تحذرك نيرين من الفطر الأزرق؛ بعضه صالح للأكل وبعضه يسبب الحمى. تعطيك وصفاً للأوراق الفضية: ثلاث وريقات ذات عروق لامعة.';
          choices=[Choice('شكرها والعودة',
          ()=>_event('village'))];
          _refresh();
        }
        ),
        Choice('العودة',
        ()=>_event('village'))];
        break;
        case 'board':story='على اللوحة ثلاث أوراق: «جرذان في مخزن الحبوب»، «مرافقة عربة إلى أرين»، و«أصوات غريبة قرب الأطلال». المكافآت متفاوتة، والخطر كذلك.';
        choices=[Choice('مهمة الجرذان — سهلة',
        ()=>_quest('جرذان مخزن الحبوب',
        'جرذ كهفي',
        12,
        8)),
        Choice('مرافقة العربة — متوسطة',
        ()=>_quest('مرافقة العربة',
        'لص طريق',
        22,
        15)),
        Choice('تفقد الأطلال — خطرة',
        ()=>_quest('أصوات الأطلال',
        'حارس أطلال',
        35,
        24)),
        Choice('العودة',
        ()=>_event('village'))];
        break;
        case 'rest':story='تغلق الباب وتجلس قرب النافذة. الراحة تعيد بعض القوة، لكن اليوم يمضي.';
        choices=[Choice('النوم حتى الصباح',
        () {
          h.hp=min(h.maxHp,
          h.hp+12);
          h.mp=min(h.maxMp,
          h.mp+8);
          h.stamina=h.maxStamina;
          h.hunger=(h.hunger+15).clamp(0,
          100).toInt();
          h.thirst=(h.thirst+18).clamp(0,
          100).toInt();
          _advance(8);
          _log('نمت واستعدت جزءاً من عافيتك.');
          _event('village');
        }
        ),
        Choice('تناول الخبز (إن وجد)',
        () {
          if(h.inventory.remove('خبز يابس')) {
            h.hunger=max(0,
            h.hunger-25);
            h.hp=min(h.maxHp,
            h.hp+2);
          }
          else story='لا يوجد خبز في حقيبتك.';
          _refresh();
        }
        ),
        Choice('العودة',
        ()=>_event('village'))];
        break;
        case 'guild':story='داخل النقابة، يراجع الموظف أوراقك. «المهام ليست لعبة. تستطيع الانسحاب، لكن لا تتوقع أجراً كاملاً».';
        choices=[Choice('سجل في النقابة',
        () {
          if(!h.flags.contains('guild')) {
            h.flags.add('guild');
            h.reputation++;
            h.inventory.add('شارة نقابة خشبية');
          }
          _event('guildhall');
        }
        ),
        Choice('لوحة المهام',
        ()=>_event('board')),
        Choice('العودة إلى القرية',
        ()=>_travel('قرية الصفصاف'))];
        break;
        case 'guildhall':story='يحضر المغامرون من أنحاء المملكة. ترى سيفاً متعباً اسمه دارن، ومعالجة هادئة تدعى إيلاف، ورامياً لا يتكلم كثيراً يدعى ساهر. يراقبونك بفضول لأنك صغير السن.';
        choices=[Choice('التحدث إلى دارن',
        () {
          h.relationships.add('دارن: معرفة');
          story='يضحك دارن دون سخرية. «تعلم الدفاع قبل الهجوم. الميت لا ينفق أجره». يعرض تدريبك على المراوغة.';
          choices=[Choice('تعلم المراوغة',
          () {
            if(!h.skills.contains('مراوغة'))h.skills.add('مراوغة');
            h.agility++;
            _advance(2);
            _event('guildhall');
          }
          ),
          Choice('شكره والابتعاد',
          ()=>_event('guildhall'))];
          _refresh();
        }
        ),
        Choice('طلب مهمة من الموظف',
        ()=>_event('board')),
        Choice('زيارة السوق',
        ()=>_travel('سوق النحاسين')),
        Choice('العودة',
        ()=>_event('village'))];
        break;
        case 'market':story='السوق مزدحم. الباعة يساومون على الطعام والأدوات والجرعات. يمكنك بيع ما لا تحتاجه أو شراء تجهيزات أفضل.';
        choices=[Choice('شراء خبز وماء (3 ذهب)',
        () {
          if(h.goldCoins>=3) {
            h.goldCoins-=3;
            h.inventory.add('خبز');
            h.inventory.add('قربة ماء');
          }
          else story='لا تملك ما يكفي.';
          _refresh();
        }
        ),
        Choice('شراء جرعة علاج (5 ذهب)',
        () {
          if(h.goldCoins>=5) {
            h.goldCoins-=5;
            h.inventory.add('جرعة علاج');
          }
          else story='لا تملك ما يكفي.';
          _refresh();
        }
        ),
        Choice('بيع غرض عشوائي',
        () {
          if(h.inventory.length>0) {
            final item=h.inventory.first;
            h.inventory.removeAt(0);
            h.goldCoins+=2;
            story='بعت $item مقابل قطعتين ذهبيتين.';
          }
          else story='لا تملك غرضاً للبيع.';
          _refresh();
        }
        ),
        Choice('العودة إلى النقابة',
        ()=>_event('guildhall'))];
        break;
        case 'questWin':story='تسقط خصمك بعد معركة متعبة. يهدأ المكان، ويمكنك أخذ الغنائم ثم العودة للمطالبة بالمكافأة.';
        choices=[Choice('جمع الغنائم',
        () {
          h.goldCoins+=2+roll(5);
          if(rng.nextBool())h.inventory.add(pick(['جلد وحش',
          'سنّ ذئب',
          'فطر أزرق',
          'قطعة حديد']));
          h.xp+=12;
          h.kills++;
          _log('انتصرت في مواجهة.');
          _levelCheck();
          _refresh();
        }
        ),
        Choice('العودة إلى القرية',
        () {
          _travel('قرية الصفصاف');
        }
        )];
        break;
        case 'questFail':story='أصبحت أنفاسك متقطعة، وتراجعك الآن أفضل من خسارة حياتك. العدو لا يطاردك بعيداً، لكنه لن يمنحك الغنائم.';
        choices=[Choice('الانسحاب',
        () {
          h.hp=max(1,
          h.hp);
          h.stamina=max(0,
          h.stamina-4);
          _travel('قرية الصفصاف');
        }
        ),
        Choice('استخدام جرعة علاج',
        () {
          _usePotion();
          _refresh();
        }
        )];
        break;
        case 'explore':story='تبدو المنطقة مختلفة عن وصف المسافرين. الطقس والوقت يؤثران في الرؤية، وقد تعثر على موارد أو خطر غير متوقع.';
        choices=[Choice('الاستكشاف بحذر',
        () {
          _advance(2);
          h.stamina=max(0,
          h.stamina-2);
          final r=roll(100);
          if(r<34) {
            final item=pick(['عشبة علاجية',
            'خشب جاف',
            'خام حديد',
            'فطر صالح',
            'قطعة نقدية']);
            h.inventory.add(item);
            story='عثرْت على: $item.';
            choices=[Choice('متابعة الاستكشاف',
            ()=>_event('explore')),
            Choice('العودة إلى مكان آمن',
            ()=>_event('village'))];
          }
          else if(r<72) {
            _fightRandom();
          }
          else {
            h.hp=min(h.maxHp,
            h.hp+2);
            story='لم تجد شيئاً، لكنك تتعلم قراءة آثار الأقدام. حدسك يتحسن.';
            h.luck++;
            choices=[Choice('المتابعة',
            ()=>_event('explore')),
            Choice('العودة',
            ()=>_event('village'))];
          }
          _refresh();
        }
        ),
        Choice('العودة',
        ()=>_event('village'))];
        break;
        case 'travel':story='تصل إلى ${h.location}. ${h.weather=='ممطر'?'المطر يجعل الطريق زلقاً.':h.weather=='ضباب كثيف'?'الضباب يخفي التفاصيل القريبة.':'الطريق هادئ نسبياً.'} تستطيع البحث عن نشاط محلي أو مواصلة الطريق.';
        choices=[Choice('استكشاف المنطقة',
        ()=>_event('explore')),
        Choice('البحث عن شخص أو متجر',
        ()=>_localOptions()),
        Choice('الراحة ساعة',
        () {
          h.stamina=min(h.maxStamina,
          h.stamina+4);
          _advance();
          _event('travel');
        }
        ),
        Choice('العودة إلى قرية الصفصاف',
        ()=>_travel('قرية الصفصاف'))];
        break;
        default:story='لا يوجد حدث هنا بعد.';
        choices=[Choice('العودة إلى الساحة',
        ()=>_event('village'))];
      }
    }
    );
  }
  void _refresh()=>setState(() {
  }
  );
  void _travel(String place) {
    h.location=place;
    _advance(rng.nextInt(3)+1);
    _log('انتقلت إلى $place.');
    if(place=='نقابة المغامرين')_event('guild');
    else if(place=='سوق النحاسين')_event('market');
    else _event('travel');
  }
  void _localOptions() {
    final opts=<Choice>[];
    if(h.location.contains('غابة')||h.location.contains('كهف')||h.location.contains('أطلال'))opts.add(Choice('البحث عن آثار وحوش',
    ()=>_fightRandom()));
    opts.add(Choice('تحدث إلى مسافر غريب',
    ()=>_stranger()));
    opts.add(Choice('جمع موارد من المكان',
    () {
      final it=pick(['خشب جاف',
      'عشبة علاجية',
      'خام حديد',
      'فطر صالح']);
      h.inventory.add(it);
      story='جمعت $it.';
      _advance();
      _refresh();
    }
    ));
    opts.add(Choice('العودة',
    ()=>_event('travel')));
    setState(()=>choices=opts);
  }
  void _stranger() {
    final n='${pick(firstNamesM)} ${pick(surnames)}';
    final line=pick(['يبحث عن أخيه المفقود.',
    'يعرض معلومة عن طريق آمن.',
    'يتهمك بأنك تتبعه.',
    'يبيع خريطة ممزقة.',
    'يسأل إن كنت تعرف شيئاً عن الأطلال.']);
    setState(() {
      story='تقابل $n. $line';
      choices=[Choice('التحدث بأدب',
      () {
        h.charisma++;
        h.relationships.add('$n: لقاء');
        h.reputation++;
        _log('تحدثت مع $n.');
        _event('travel');
      }
      ),
      Choice('سؤاله عن عمل',
      () {
        h.quests.add('طلب من $n');
        story='يخبرك أن هناك عملاً محتملاً، لكنه لا يثق بك بما يكفي ليكشف التفاصيل الآن.';
        choices=[Choice('قبول الأمر المبدئي',
        () {
          h.goldCoins+=1;
          _event('travel');
        }
        )];
        _refresh();
      }
      ),
      Choice('الابتعاد',
      ()=>_event('travel'))];
    }
    );
  }
  void _quest(String title,
  String monster,
  int reward,
  int danger) {
    if(h.completedQuests.contains(title)) {
      setState(() {
        story = 'أنجزت هذه المهمة من قبل. يمكنك البحث عن مهمة أخرى.';
        choices = [Choice('العودة إلى اللوحة', () => _event('board'))];
      });
      return;
    }
    h.quests.add(title);
    h.location=title=='مرافقة العربة'?'ممر القوافل':title=='أصوات الأطلال'?'أطلال الحراس':'مخزن الحبوب';
    _advance(2);
    final data=monsters.firstWhere((m)=>m[0]==monster);
    _combat(data,
    reward,
    danger,
    title);
  }
  void _combat(List<dynamic> enemy,
  int reward,
  int danger,
  String quest) {
    int enemyHp=enemy[1] as int;
    final enemyAtk=enemy[2] as int;
    String log='ظهر ${enemy[0]}! صحته $enemyHp. حركتك التالية قد تحسم المعركة.';
    setState(() {
      story=log;
      choices=[Choice('هجوم عادي',
      () {
        final dmg=max(1,
        h.attack+roll(6)-2);
        enemyHp-=dmg;
        h.stamina=max(0,
        h.stamina-2);
        if(enemyHp<=0) {
          _winQuest(quest,
          reward);
          return;
        }
        final hurt=max(1,
        enemyAtk+roll(4)-h.agility~/3-h.defense);
        h.hp-=hurt;
        _combatContinue(enemy,
        enemyHp,
        enemyAtk,
        reward,
        quest,
        'أصبت العدو بـ$dmg، وتلقيت $hurt ضرراً.');
      }
      ),
      Choice('هجوم قوي (4 تحمّل)',
      () {
        if(h.stamina<4) {
          story='تحملك لا يكفي لهجوم قوي.';
          _refresh();
          return;
        }
        h.stamina-=4;
        final dmg=max(2,
        h.attack+roll(10));
        enemyHp-=dmg;
        if(enemyHp<=0) {
          _winQuest(quest,
          reward);
          return;
        }
        final hurt=max(1,
        enemyAtk+roll(4)-h.agility~/3-h.defense);
        h.hp-=hurt;
        _combatContinue(enemy,
        enemyHp,
        enemyAtk,
        reward,
        quest,
        'نفذت ضربة قوية بقيمة $dmg وتلقيت $hurt ضرراً.');
      }
      ),
      Choice('مراوغة',
      () {
        final evade=roll(20)+h.agility+(h.skills.contains('مراوغة')?4:0);
        if(evade>=12) {
          h.stamina=max(0,
          h.stamina-1);
          _combatContinue(enemy,
          enemyHp,
          enemyAtk,
          reward,
          quest,
          'تفاديت الهجوم بنجاح. صحة العدو $enemyHp.');
        }
        else {
          final hurt=max(1,
          enemyAtk+roll(3)-h.defense);
          h.hp-=hurt;
          _combatContinue(enemy,
          enemyHp,
          enemyAtk,
          reward,
          quest,
          'فشلت المراوغة وتلقيت $hurt ضرراً.');
        }
      }
      ),
      Choice('استخدام جرعة علاج',
      () {
        if(!_usePotion()) {
          story='لا تملك جرعة علاج.';
          _refresh();
          return;
        }
        final hurt=max(1,
        enemyAtk+roll(3)-h.defense);
        h.hp-=hurt;
        _combatContinue(enemy,
        enemyHp,
        enemyAtk,
        reward,
        quest,
        'استعملت جرعة، لكن العدو هاجمك وأصابك بـ$hurt.');
      }
      ),
      Choice('الهرب',
      () {
        h.stamina=max(0,
        h.stamina-3);
        _log('انسحبت من مواجهة ${enemy[0]}.');
        _travel('قرية الصفصاف');
      }
      )];
    }
    );
  }
  void _combatContinue(List<dynamic> enemy,
  int enemyHp,
  int enemyAtk,
  int reward,
  String quest,
  String result) {
    if(h.hp<=0) {
      h.hp=1;
      h.wounds++;
      h.goldCoins=max(0,
      h.goldCoins-3);
      h.location='قرية الصفصاف';
      _log('أغمي عليك ونقلك أحد المسافرين إلى القرية.');
      setState(() {
        story='$result\nانهارت قواك. فقدت بعض المال واستيقظت في القرية مصاباً.';
        choices=[Choice('استعادة الوعي',
        ()=>_event('village'))];
      }
      );
      return;
    }
    setState(() {
      story='$result\n${enemy[0]}: $enemyHp صحة متبقية. صحتك: ${h.hp}/${h.maxHp}.';
      choices=[Choice('الهجوم',
      () {
        final dmg=max(1,
        h.attack+roll(6)-2);
        enemyHp-=dmg;
        if(enemyHp<=0) {
          _winQuest(quest,
          reward);
          return;
        }
        final hurt=max(1,
        enemyAtk+roll(4)-h.agility~/3-h.defense);
        h.hp-=hurt;
        _combatContinue(enemy,
        enemyHp,
        enemyAtk,
        reward,
        quest,
        'ألحقت $dmg ضرراً وتلقيت $hurt.');
      }
      ),
      Choice('هجوم قوي',
      () {
        if(h.stamina<4) {
          story='تحملك لا يكفي.';
          _refresh();
          return;
        }
        h.stamina-=4;
        final dmg=h.attack+roll(10);
        enemyHp-=dmg;
        if(enemyHp<=0) {
          _winQuest(quest,
          reward);
          return;
        }
        final hurt=max(1,
        enemyAtk+roll(4)-h.defense);
        h.hp-=hurt;
        _combatContinue(enemy,
        enemyHp,
        enemyAtk,
        reward,
        quest,
        'ألحقت $dmg ضرراً وتلقيت $hurt.');
      }
      ),
      Choice('جرعة علاج',
      () {
        if(!_usePotion()) {
          story='لا توجد جرعة.';
          _refresh();
          return;
        }
        final hurt=max(1,
        enemyAtk+roll(3)-h.defense);
        h.hp-=hurt;
        _combatContinue(enemy,
        enemyHp,
        enemyAtk,
        reward,
        quest,
        'استعملت جرعة وتلقيت $hurt ضرراً.');
      }
      ),
      Choice('الانسحاب',
      ()=>_travel('قرية الصفصاف'))];
    }
    );
  }
  void _winQuest(String quest,
  int reward) {
    h.xp+=18;
    h.goldCoins+=reward;
    h.kills++;
    h.completedQuests.add(quest);
    h.quests.remove(quest);
    _levelCheck();
    _log('أنجزت مهمة $quest وربحت $reward ذهباً.');
    setState(() {
      story='انتصرت وأكملت مهمة «$quest». حصلت على $reward قطعة ذهبية وخبرة. يمكنك متابعة الاستكشاف أو العودة للمطالبة بمهمة جديدة.';
      choices=[Choice('جمع الغنائم',
      () {
        h.inventory.add(pick(['جلد وحش',
        'سنّ ذئب',
        'خام حديد',
        'قطعة أثرية صغيرة']));
        _event('travel');
      }
      ),
      Choice('العودة إلى اللوحة',
      ()=>_event('board'))];
    }
    );
  }
  void _fightRandom() {
    final eligible=monsters.where((m)=>(m[1] as int)<=20+h.level*12).toList();
    final e=eligible[rng.nextInt(eligible.length)];
    _combat(e,
    5+(e[4] as int),
    10,
    'مواجهة عشوائية');
  }
  bool _usePotion() {
    if(h.inventory.remove('جرعة علاج')) {
      h.hp=min(h.maxHp,
      h.hp+18);
      h.wounds=max(0,
      h.wounds-1);
      return true;
    }
    if(h.inventory.remove('عشبة علاجية')) {
      h.hp=min(h.maxHp,
      h.hp+7);
      return true;
    }
    return false;
  }
  void _levelCheck() {
    while(h.xp>=h.level*30) {
      h.xp-=h.level*30;
      h.level++;
      h.maxHp+=5;
      h.hp=h.maxHp;
      h.maxMp+=2;
      h.mp=h.maxMp;
      h.maxStamina+=2;
      h.stamina=h.maxStamina;
      h.strength++;
      if(rng.nextBool())h.agility++;
      final s=pick(skills);
      if(!h.skills.contains(s))h.skills.add(s);
      _log('ارتقيت إلى المستوى ${h.level} وتعلمت: $s.');
    }
  }
  void _status() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: panel,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: StatefulBuilder(
          builder: (context, setModalState) => Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'الشخصية',
                    style: TextStyle(
                      fontSize: 22,
                      color: gold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('${h.name} • ${h.gender} • ${h.race}'),
                  Text('العمر ${h.age} • ${h.role} • المستوى ${h.level}'),
                  const SizedBox(height: 12),
                  Text('الصحة ${h.hp}/${h.maxHp}   المانا ${h.mp}/${h.maxMp}'),
                  Text('التحمل ${h.stamina}/${h.maxStamina}   الخبرة ${h.xp}/${h.level * 30}'),
                  Text('القوة ${h.strength} • الرشاقة ${h.agility} • الذكاء ${h.intelligence} • الكاريزما ${h.charisma} • الحظ ${h.luck}'),
                  Text('الجوع ${h.hunger}% • العطش ${h.thirst}% • الجروح ${h.wounds}'),
                  Text('الذهب ${h.goldCoins} • السمعة ${h.reputation} • الانتصارات ${h.kills}'),
                  const Divider(),
                  const Text('القدرات', style: TextStyle(color: gold)),
                  Text(h.skills.isEmpty ? 'لم تتعلم قدرات بعد.' : h.skills.join('، ')),
                  const Divider(),
                  const Text('المعدات', style: TextStyle(color: gold)),
                  Text('السلاح +${h.equipment['سلاح']} • الدرع +${h.equipment['درع']}'),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        _inventory();
                      },
                      child: const Text('فتح الحقيبة'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _inventory() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: panel,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('الحقيبة', style: TextStyle(fontSize: 22, color: gold)),
              if (h.inventory.isEmpty) const Text('الحقيبة فارغة.'),
              ...h.inventory.toSet().map((item) => ListTile(
                title: Text(item),
                trailing: Text('×${h.inventory.where((x) => x == item).length}'),
                onTap: () {
                  if (item == 'خبز' || item == 'خبز يابس') {
                    h.inventory.remove(item);
                    h.hunger = max(0, h.hunger - 25);
                    h.hp = min(h.maxHp, h.hp + 2);
                  } else if (item == 'قربة ماء' || item == 'قارورة ماء') {
                    h.inventory.remove(item);
                    h.thirst = max(0, h.thirst - 35);
                  } else if (item == 'جرعة علاج' || item == 'عشبة علاجية') {
                    _usePotion();
                  } else if (item == 'سكين مستعمل') {
                    h.equipment['سلاح'] = 2;
                    h.inventory.remove(item);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('لا يمكن استخدام $item الآن.')),
                    );
                    return;
                  }
                  Navigator.pop(sheetContext);
                  _refresh();
                },
              )),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _map() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: panel,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: [
            const Text('خريطة المملكة', style: TextStyle(fontSize: 22, color: gold)),
            const Text('الانتقال يستهلك وقتاً وقد يسبب أحداثاً على الطريق.'),
            ...locations.map((loc) => ListTile(
              leading: Icon(loc == h.location ? Icons.location_on : Icons.place,
                color: loc == h.location ? gold : Colors.white54),
              title: Text(loc),
              subtitle: Text(loc == h.location ? 'موقعك الحالي' : ''),
              onTap: () {
                Navigator.pop(sheetContext);
                if (loc != h.location) _travel(loc);
              },
            )),
          ],
        ),
      ),
    );
  }

  void _journal() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: panel,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: SizedBox(
          height: MediaQuery.of(sheetContext).size.height * 0.7,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('سجل الرحلة', style: TextStyle(fontSize: 22, color: gold)),
              ...h.journal.reversed.map((entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('• $entry'),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(h.location, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(onPressed: _save, icon: const Icon(Icons.save)),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'status') _status();
              if (value == 'bag') _inventory();
              if (value == 'map') _map();
              if (value == 'journal') _journal();
              if (value == 'save') _save();
              if (value == 'menu') Navigator.pop(context);
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'status', child: Text('الشخصية والإحصائيات')),
              PopupMenuItem(value: 'bag', child: Text('الحقيبة')),
              PopupMenuItem(value: 'map', child: Text('الخريطة')),
              PopupMenuItem(value: 'journal', child: Text('سجل الرحلة')),
              PopupMenuItem(value: 'save', child: Text('حفظ')),
              PopupMenuItem(value: 'menu', child: Text('القائمة الرئيسية')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            color: panel,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 12,
              runSpacing: 6,
              children: [
                Text('❤️ ${h.hp}/${h.maxHp}'),
                Text('✦ ${h.mp}/${h.maxMp}'),
                Text('◈ ${h.goldCoins} ذهب'),
                Text('اليوم ${h.day} • ${h.timeOfDay}'),
                Text(h.weather),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('${h.name}، ${h.age} سنة',
                  style: const TextStyle(color: gold, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(12)),
                  child: Text(story, style: const TextStyle(fontSize: 17, height: 1.8)),
                ),
                const SizedBox(height: 16),
                ...choices.map((choice) => Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: busy ? null : choice.run,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: gold),
                      ),
                      child: Text(choice.label, textAlign: TextAlign.center),
                    ),
                  ),
                )),
                const SizedBox(height: 10),
                Text('الموقع: ${h.location} • الطقس: ${h.weather}',
                  style: const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: panel,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(tooltip: 'الشخصية', onPressed: _status, icon: const Icon(Icons.person_outline)),
            IconButton(tooltip: 'الحقيبة', onPressed: _inventory, icon: const Icon(Icons.backpack_outlined)),
            IconButton(tooltip: 'الخريطة', onPressed: _map, icon: const Icon(Icons.map_outlined)),
            IconButton(tooltip: 'السجل', onPressed: _journal, icon: const Icon(Icons.menu_book)),
            IconButton(tooltip: 'حفظ', onPressed: _save, icon: const Icon(Icons.save_outlined)),
          ],
        ),
      ),
    );
  }

}
class Choice {
  final String label;
  final VoidCallback run;
  Choice(this.label,
  this.run);
}
