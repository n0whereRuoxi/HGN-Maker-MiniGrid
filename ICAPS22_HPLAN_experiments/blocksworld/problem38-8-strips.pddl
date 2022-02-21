( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b722 - block
    b319 - block
    b648 - block
    b968 - block
    b630 - block
    b134 - block
    b853 - block
    b679 - block
    b106 - block
    b826 - block
    b824 - block
    b538 - block
    b792 - block
    b446 - block
    b513 - block
    b807 - block
    b122 - block
    b838 - block
    b35 - block
    b168 - block
    b63 - block
    b482 - block
    b431 - block
    b53 - block
    b119 - block
    b447 - block
    b810 - block
    b484 - block
    b364 - block
    b874 - block
    b3 - block
    b420 - block
    b975 - block
    b269 - block
    b100 - block
    b153 - block
    b443 - block
    b642 - block
    b297 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b722 )
    ( on b319 b722 )
    ( on b648 b319 )
    ( on b968 b648 )
    ( on b630 b968 )
    ( on b134 b630 )
    ( on b853 b134 )
    ( on b679 b853 )
    ( on b106 b679 )
    ( on b826 b106 )
    ( on b824 b826 )
    ( on b538 b824 )
    ( on b792 b538 )
    ( on b446 b792 )
    ( on b513 b446 )
    ( on b807 b513 )
    ( on b122 b807 )
    ( on b838 b122 )
    ( on b35 b838 )
    ( on b168 b35 )
    ( on b63 b168 )
    ( on b482 b63 )
    ( on b431 b482 )
    ( on b53 b431 )
    ( on b119 b53 )
    ( on b447 b119 )
    ( on b810 b447 )
    ( on b484 b810 )
    ( on b364 b484 )
    ( on b874 b364 )
    ( on b3 b874 )
    ( on b420 b3 )
    ( on b975 b420 )
    ( on b269 b975 )
    ( on b100 b269 )
    ( on b153 b100 )
    ( on b443 b153 )
    ( on b642 b443 )
    ( on b297 b642 )
    ( clear b297 )
  )
  ( :goal
    ( and
      ( clear b722 )
    )
  )
)
