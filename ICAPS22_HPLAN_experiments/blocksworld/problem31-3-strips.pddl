( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b950 - block
    b146 - block
    b731 - block
    b503 - block
    b431 - block
    b45 - block
    b430 - block
    b979 - block
    b683 - block
    b34 - block
    b704 - block
    b746 - block
    b933 - block
    b853 - block
    b859 - block
    b199 - block
    b880 - block
    b416 - block
    b563 - block
    b160 - block
    b480 - block
    b808 - block
    b2 - block
    b593 - block
    b939 - block
    b525 - block
    b92 - block
    b830 - block
    b232 - block
    b673 - block
    b136 - block
    b551 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b950 )
    ( on b146 b950 )
    ( on b731 b146 )
    ( on b503 b731 )
    ( on b431 b503 )
    ( on b45 b431 )
    ( on b430 b45 )
    ( on b979 b430 )
    ( on b683 b979 )
    ( on b34 b683 )
    ( on b704 b34 )
    ( on b746 b704 )
    ( on b933 b746 )
    ( on b853 b933 )
    ( on b859 b853 )
    ( on b199 b859 )
    ( on b880 b199 )
    ( on b416 b880 )
    ( on b563 b416 )
    ( on b160 b563 )
    ( on b480 b160 )
    ( on b808 b480 )
    ( on b2 b808 )
    ( on b593 b2 )
    ( on b939 b593 )
    ( on b525 b939 )
    ( on b92 b525 )
    ( on b830 b92 )
    ( on b232 b830 )
    ( on b673 b232 )
    ( on b136 b673 )
    ( on b551 b136 )
    ( clear b551 )
  )
  ( :goal
    ( and
      ( clear b950 )
    )
  )
)
