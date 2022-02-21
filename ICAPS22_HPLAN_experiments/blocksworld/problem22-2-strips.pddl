( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b326 - block
    b510 - block
    b172 - block
    b576 - block
    b38 - block
    b78 - block
    b319 - block
    b614 - block
    b735 - block
    b435 - block
    b602 - block
    b423 - block
    b775 - block
    b472 - block
    b829 - block
    b957 - block
    b111 - block
    b447 - block
    b504 - block
    b475 - block
    b173 - block
    b715 - block
    b189 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b326 )
    ( on b510 b326 )
    ( on b172 b510 )
    ( on b576 b172 )
    ( on b38 b576 )
    ( on b78 b38 )
    ( on b319 b78 )
    ( on b614 b319 )
    ( on b735 b614 )
    ( on b435 b735 )
    ( on b602 b435 )
    ( on b423 b602 )
    ( on b775 b423 )
    ( on b472 b775 )
    ( on b829 b472 )
    ( on b957 b829 )
    ( on b111 b957 )
    ( on b447 b111 )
    ( on b504 b447 )
    ( on b475 b504 )
    ( on b173 b475 )
    ( on b715 b173 )
    ( on b189 b715 )
    ( clear b189 )
  )
  ( :goal
    ( and
      ( clear b326 )
    )
  )
)
