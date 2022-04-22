( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b702 - block
    b195 - block
    b986 - block
    b128 - block
    b613 - block
    b575 - block
    b901 - block
    b94 - block
    b355 - block
    b639 - block
    b889 - block
    b871 - block
    b949 - block
    b240 - block
    b988 - block
    b289 - block
    b920 - block
    b795 - block
    b228 - block
    b345 - block
    b632 - block
    b780 - block
    b965 - block
    b534 - block
    b417 - block
    b880 - block
    b276 - block
    b903 - block
    b829 - block
    b37 - block
    b455 - block
    b803 - block
    b202 - block
    b970 - block
    b134 - block
    b397 - block
    b713 - block
    b891 - block
    b262 - block
    b275 - block
    b141 - block
    b572 - block
    b172 - block
    b156 - block
    b664 - block
    b319 - block
    b41 - block
    b523 - block
    b420 - block
    b918 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b702 )
    ( on b195 b702 )
    ( on b986 b195 )
    ( on b128 b986 )
    ( on b613 b128 )
    ( on b575 b613 )
    ( on b901 b575 )
    ( on b94 b901 )
    ( on b355 b94 )
    ( on b639 b355 )
    ( on b889 b639 )
    ( on b871 b889 )
    ( on b949 b871 )
    ( on b240 b949 )
    ( on b988 b240 )
    ( on b289 b988 )
    ( on b920 b289 )
    ( on b795 b920 )
    ( on b228 b795 )
    ( on b345 b228 )
    ( on b632 b345 )
    ( on b780 b632 )
    ( on b965 b780 )
    ( on b534 b965 )
    ( on b417 b534 )
    ( on b880 b417 )
    ( on b276 b880 )
    ( on b903 b276 )
    ( on b829 b903 )
    ( on b37 b829 )
    ( on b455 b37 )
    ( on b803 b455 )
    ( on b202 b803 )
    ( on b970 b202 )
    ( on b134 b970 )
    ( on b397 b134 )
    ( on b713 b397 )
    ( on b891 b713 )
    ( on b262 b891 )
    ( on b275 b262 )
    ( on b141 b275 )
    ( on b572 b141 )
    ( on b172 b572 )
    ( on b156 b172 )
    ( on b664 b156 )
    ( on b319 b664 )
    ( on b41 b319 )
    ( on b523 b41 )
    ( on b420 b523 )
    ( on b918 b420 )
    ( clear b918 )
  )
  ( :goal
    ( and
      ( clear b702 )
    )
  )
)
