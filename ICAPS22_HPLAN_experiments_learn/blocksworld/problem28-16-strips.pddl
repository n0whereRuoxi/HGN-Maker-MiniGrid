( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b802 - block
    b529 - block
    b472 - block
    b180 - block
    b373 - block
    b319 - block
    b481 - block
    b306 - block
    b742 - block
    b460 - block
    b40 - block
    b552 - block
    b168 - block
    b446 - block
    b973 - block
    b98 - block
    b411 - block
    b456 - block
    b899 - block
    b690 - block
    b303 - block
    b870 - block
    b480 - block
    b943 - block
    b535 - block
    b82 - block
    b308 - block
    b780 - block
    b889 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b802 )
    ( on b529 b802 )
    ( on b472 b529 )
    ( on b180 b472 )
    ( on b373 b180 )
    ( on b319 b373 )
    ( on b481 b319 )
    ( on b306 b481 )
    ( on b742 b306 )
    ( on b460 b742 )
    ( on b40 b460 )
    ( on b552 b40 )
    ( on b168 b552 )
    ( on b446 b168 )
    ( on b973 b446 )
    ( on b98 b973 )
    ( on b411 b98 )
    ( on b456 b411 )
    ( on b899 b456 )
    ( on b690 b899 )
    ( on b303 b690 )
    ( on b870 b303 )
    ( on b480 b870 )
    ( on b943 b480 )
    ( on b535 b943 )
    ( on b82 b535 )
    ( on b308 b82 )
    ( on b780 b308 )
    ( on b889 b780 )
    ( clear b889 )
  )
  ( :goal
    ( and
      ( clear b802 )
    )
  )
)
