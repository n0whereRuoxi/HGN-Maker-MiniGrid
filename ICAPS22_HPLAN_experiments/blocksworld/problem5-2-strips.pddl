( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b148 - block
    b326 - block
    b308 - block
    b431 - block
    b36 - block
    b284 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b148 )
    ( on b326 b148 )
    ( on b308 b326 )
    ( on b431 b308 )
    ( on b36 b431 )
    ( on b284 b36 )
    ( clear b284 )
  )
  ( :goal
    ( and
      ( clear b148 )
    )
  )
)
