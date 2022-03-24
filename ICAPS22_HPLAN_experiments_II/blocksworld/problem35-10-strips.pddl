( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b907 - block
    b757 - block
    b771 - block
    b945 - block
    b925 - block
    b612 - block
    b453 - block
    b462 - block
    b113 - block
    b75 - block
    b129 - block
    b410 - block
    b806 - block
    b405 - block
    b510 - block
    b105 - block
    b526 - block
    b717 - block
    b30 - block
    b759 - block
    b460 - block
    b795 - block
    b703 - block
    b203 - block
    b724 - block
    b319 - block
    b810 - block
    b50 - block
    b54 - block
    b74 - block
    b442 - block
    b298 - block
    b41 - block
    b875 - block
    b997 - block
    b828 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b907 )
    ( on b757 b907 )
    ( on b771 b757 )
    ( on b945 b771 )
    ( on b925 b945 )
    ( on b612 b925 )
    ( on b453 b612 )
    ( on b462 b453 )
    ( on b113 b462 )
    ( on b75 b113 )
    ( on b129 b75 )
    ( on b410 b129 )
    ( on b806 b410 )
    ( on b405 b806 )
    ( on b510 b405 )
    ( on b105 b510 )
    ( on b526 b105 )
    ( on b717 b526 )
    ( on b30 b717 )
    ( on b759 b30 )
    ( on b460 b759 )
    ( on b795 b460 )
    ( on b703 b795 )
    ( on b203 b703 )
    ( on b724 b203 )
    ( on b319 b724 )
    ( on b810 b319 )
    ( on b50 b810 )
    ( on b54 b50 )
    ( on b74 b54 )
    ( on b442 b74 )
    ( on b298 b442 )
    ( on b41 b298 )
    ( on b875 b41 )
    ( on b997 b875 )
    ( on b828 b997 )
    ( clear b828 )
  )
  ( :goal
    ( and
      ( clear b907 )
    )
  )
)
