( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b578 - block
    b489 - block
    b803 - block
    b763 - block
    b479 - block
    b563 - block
    b50 - block
    b129 - block
    b172 - block
    b168 - block
    b860 - block
    b355 - block
    b495 - block
    b234 - block
    b101 - block
    b898 - block
    b556 - block
    b848 - block
    b246 - block
    b41 - block
    b299 - block
    b393 - block
    b436 - block
    b966 - block
    b869 - block
    b693 - block
    b737 - block
    b535 - block
    b220 - block
    b699 - block
    b870 - block
    b913 - block
    b114 - block
    b55 - block
    b262 - block
    b271 - block
    b697 - block
    b592 - block
    b40 - block
    b522 - block
    b524 - block
    b86 - block
    b755 - block
    b105 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b578 )
    ( on b489 b578 )
    ( on b803 b489 )
    ( on b763 b803 )
    ( on b479 b763 )
    ( on b563 b479 )
    ( on b50 b563 )
    ( on b129 b50 )
    ( on b172 b129 )
    ( on b168 b172 )
    ( on b860 b168 )
    ( on b355 b860 )
    ( on b495 b355 )
    ( on b234 b495 )
    ( on b101 b234 )
    ( on b898 b101 )
    ( on b556 b898 )
    ( on b848 b556 )
    ( on b246 b848 )
    ( on b41 b246 )
    ( on b299 b41 )
    ( on b393 b299 )
    ( on b436 b393 )
    ( on b966 b436 )
    ( on b869 b966 )
    ( on b693 b869 )
    ( on b737 b693 )
    ( on b535 b737 )
    ( on b220 b535 )
    ( on b699 b220 )
    ( on b870 b699 )
    ( on b913 b870 )
    ( on b114 b913 )
    ( on b55 b114 )
    ( on b262 b55 )
    ( on b271 b262 )
    ( on b697 b271 )
    ( on b592 b697 )
    ( on b40 b592 )
    ( on b522 b40 )
    ( on b524 b522 )
    ( on b86 b524 )
    ( on b755 b86 )
    ( on b105 b755 )
    ( on b993 b105 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b578 )
    )
  )
)
