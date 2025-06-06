echo "============================================="
echo "Скрипт для лабораторной работы номер 2 по ОПИ."
echo "Скрипт для svn."
echo -e "=============================================\n"

echo "Очистка предыдущих данных..."
rm -rf test_rep work_rep
echo -e "=============================================\n"


echo "Создание нового репозитория..."
svnadmin create test_rep
REPO_URL="file://$(pwd)/test_rep"
echo -e "=============================================\n"


echo "Создание структуры репозитория..."
svn mkdir -m "Создаем стандартную структуру." \
    "$REPO_URL/trunk" \
    "$REPO_URL/branches" \
    "$REPO_URL/tags"
echo -e "=============================================\n"


echo "Создание рабочей копии..."
svn checkout "$REPO_URL/trunk" work_rep
cd work_rep 
echo -e "=============================================\n"

svn resolve --accept=postpone -R .

echo "Добавление начальных файлов..."
unzip -o ../../commits/commit0.zip -d .
svn add --force .
svn commit -m "Initial first commit r0" --username red
echo "Коммит r0 создан."
echo -e "=============================================\n"


svn copy $REPO_URL/trunk $REPO_URL/branches/branch2 -m "Creating branch2"
svn switch $REPO_URL/branches/branch2


svn rm *
unzip -o ../../commits/commit1.zip -d .
svn add *
svn commit -m "Commit r1" --username=blue
echo "Коммит r1 создан."
echo -e "=============================================\n"



svn switch $REPO_URL/trunk
svn rm *
unzip -o ../../commits/commit2.zip -d .
svn add *
svn commit -m "Commit r2" --username=red
echo "Коммит r2 создан."
echo -e "=============================================\n"


svn switch $REPO_URL/branches/branch2
svn rm *
unzip -o ../../commits/commit3.zip -d .
svn add *
svn commit -m "Commit r3" --username=blue
echo "Коммит r3 создан."
echo -e "=============================================\n"


svn copy $REPO_URL/branches/branch2 $REPO_URL/branches/branch3 -m "Creating branch3"
svn switch $REPO_URL/branches/branch3

svn rm *
unzip -o ../../commits/commit4.zip -d .
svn add *
svn commit -m "Commit r4" --username=blue
echo "Коммит r4 создан."
echo -e "=============================================\n"


svn switch $REPO_URL/branches/branch2
svn rm *
unzip -o ../../commits/commit5.zip -d .
svn add *
svn commit -m "Commit r5" --username=blue
echo "Коммит r5 создан."
echo -e "=============================================\n"




svn switch $REPO_URL/branches/branch3
svn rm *
unzip -o ../../commits/commit6.zip -d .
svn add *
svn commit -m "Commit r6" --username=blue
echo "Коммит r6 создан."
echo -e "=============================================\n"




svn rm *
unzip -o ../../commits/commit7.zip -d .
svn add *
svn commit -m "Commit r7" --username=blue
echo "Коммит r7 создан."
echo -e "=============================================\n"



svn switch $REPO_URL/trunk
svn rm *
unzip -o ../../commits/commit8.zip -d .
svn add *
svn commit -m "Commit r8" --username=red
echo "Коммит r8 создан."
echo -e "=============================================\n"


svn rm *
unzip -o ../../commits/commit9.zip -d .
svn add *
svn commit -m "Commit r9" --username=red
echo "Коммит r9 создан."
echo -e "=============================================\n"



svn rm *
unzip -o ../../commits/commit10.zip -d .
svn add *
svn commit -m "Commit r10" --username=red
echo "Коммит r10 создан."
echo -e "=============================================\n"


svn switch $REPO_URL/branches/branch3
svn rm *
unzip -o ../../commits/commit11.zip -d .
svn add *
svn commit -m "Commit r11" --username=blue
echo "Коммит r11 создан."
echo -e "=============================================\n"



svn switch $REPO_URL/branches/branch2
svn rm *
unzip -o ../../commits/commit12.zip -d .
svn add *
svn commit -m "Commit r12" --username=blue
echo "Коммит r12 создан."
echo -e "=============================================\n"


svn update

svn switch $REPO_URL/branches/branch3
svn merge $REPO_URL/branches/branch2


svn resolve --accept=working D.java
svn resolve --accept=working H.java
svn resolve --accept=working I.java
svn resolve --accept=working Eq1Tgt0j2T.73l



svn commit -m "Слияние 2 и 3 ветки голубым пользователем." --username=blue






# Или еще варианты 
#
#
# Через svn resolve --accept=theirs-full D.java 
#
#
# Или вручную
# svn cat H.java > H.java.mine
# svn cat ^/branches/branch2/H.java@HEAD > H.java.theirs
# code -d H.java.mine H.java.theirs
# code H.java сохраняем изменения
# svn resolve --accept=working H.java  
# 
# svn cat I.java > I.java.mine
# svn cat ^/branches/branch2/I.java@HEAD > I.java.theirs
# code -d I.java.mine I.java.theirs
# code I.java
# svn resolve --accept=working I.java
#
# svn resolve --accept=working Eq1Tgt0j2T.73l
# или
# svn cp ^/branches/branch2/Eq1Tgt0j2T.73l@HEAD Eq1Tgt0j2T.73l
# svn resolve --accept=working Eq1Tgt0j2T.73l
#
# svn commit -m "Ручное слияние ветки 2 и ветки 3" --username=blue
#
#


svn rm *
unzip -o ../../commits/commit13.zip -d .
svn add *
svn commit -m "Commit r13" --username=blue
echo "Коммит r13 создан."
echo -e "=============================================\n"


svn switch $REPO_URL/trunk
svn merge $REPO_URL/branches/branch3

svn resolve --accept=working D.java
svn resolve --accept=working H.java
svn resolve --accept=working I.java

svn commit -m "Слияние 1 и 3 ветки красным пользователем." --username=red



svn rm *
unzip -o ../../commits/commit14.zip -d .
svn add *
svn commit -m "Commit r14" --username=blue
echo "Коммит r14 создан."
echo -e "=============================================\n"


