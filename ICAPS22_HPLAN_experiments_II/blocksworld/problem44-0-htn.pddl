( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b503 - block
    b817 - block
    b697 - block
    b816 - block
    b754 - block
    b400 - block
    b418 - block
    b719 - block
    b664 - block
    b989 - block
    b422 - block
    b916 - block
    b740 - block
    b735 - block
    b289 - block
    b288 - block
    b650 - block
    b548 - block
    b500 - block
    b759 - block
    b359 - block
    b280 - block
    b645 - block
    b138 - block
    b801 - block
    b410 - block
    b452 - block
    b11 - block
    b266 - block
    b785 - block
    b4 - block
    b946 - block
    b435 - block
    b6 - block
    b996 - block
    b88 - block
    b148 - block
    b932 - block
    b103 - block
    b952 - block
    b246 - block
    b3 - block
    b570 - block
    b307 - block
    b808 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b503 )
    ( on b817 b503 )
    ( on b697 b817 )
    ( on b816 b697 )
    ( on b754 b816 )
    ( on b400 b754 )
    ( on b418 b400 )
    ( on b719 b418 )
    ( on b664 b719 )
    ( on b989 b664 )
    ( on b422 b989 )
    ( on b916 b422 )
    ( on b740 b916 )
    ( on b735 b740 )
    ( on b289 b735 )
    ( on b288 b289 )
    ( on b650 b288 )
    ( on b548 b650 )
    ( on b500 b548 )
    ( on b759 b500 )
    ( on b359 b759 )
    ( on b280 b359 )
    ( on b645 b280 )
    ( on b138 b645 )
    ( on b801 b138 )
    ( on b410 b801 )
    ( on b452 b410 )
    ( on b11 b452 )
    ( on b266 b11 )
    ( on b785 b266 )
    ( on b4 b785 )
    ( on b946 b4 )
    ( on b435 b946 )
    ( on b6 b435 )
    ( on b996 b6 )
    ( on b88 b996 )
    ( on b148 b88 )
    ( on b932 b148 )
    ( on b103 b932 )
    ( on b952 b103 )
    ( on b246 b952 )
    ( on b3 b246 )
    ( on b570 b3 )
    ( on b307 b570 )
    ( on b808 b307 )
    ( clear b808 )
  )
  ( :tasks
    ( Make-44Pile b817 b697 b816 b754 b400 b418 b719 b664 b989 b422 b916 b740 b735 b289 b288 b650 b548 b500 b759 b359 b280 b645 b138 b801 b410 b452 b11 b266 b785 b4 b946 b435 b6 b996 b88 b148 b932 b103 b952 b246 b3 b570 b307 b808 )
  )
)
