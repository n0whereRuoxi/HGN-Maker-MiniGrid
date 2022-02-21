( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b466 - block
    b65 - block
    b627 - block
    b231 - block
    b915 - block
    b991 - block
    b973 - block
    b720 - block
    b665 - block
    b480 - block
    b145 - block
    b59 - block
    b996 - block
    b778 - block
    b770 - block
    b568 - block
    b988 - block
    b471 - block
    b548 - block
    b423 - block
    b642 - block
    b258 - block
    b368 - block
    b554 - block
    b519 - block
    b94 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b466 )
    ( on b65 b466 )
    ( on b627 b65 )
    ( on b231 b627 )
    ( on b915 b231 )
    ( on b991 b915 )
    ( on b973 b991 )
    ( on b720 b973 )
    ( on b665 b720 )
    ( on b480 b665 )
    ( on b145 b480 )
    ( on b59 b145 )
    ( on b996 b59 )
    ( on b778 b996 )
    ( on b770 b778 )
    ( on b568 b770 )
    ( on b988 b568 )
    ( on b471 b988 )
    ( on b548 b471 )
    ( on b423 b548 )
    ( on b642 b423 )
    ( on b258 b642 )
    ( on b368 b258 )
    ( on b554 b368 )
    ( on b519 b554 )
    ( on b94 b519 )
    ( clear b94 )
  )
  ( :goal
    ( and
      ( clear b466 )
    )
  )
)
