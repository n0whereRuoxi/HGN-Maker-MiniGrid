( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b937 - block
    b994 - block
    b360 - block
    b535 - block
    b930 - block
    b18 - block
    b912 - block
    b326 - block
    b284 - block
    b903 - block
    b892 - block
    b660 - block
    b366 - block
    b606 - block
    b961 - block
    b386 - block
    b410 - block
    b101 - block
    b579 - block
    b440 - block
    b864 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b937 )
    ( on b994 b937 )
    ( on b360 b994 )
    ( on b535 b360 )
    ( on b930 b535 )
    ( on b18 b930 )
    ( on b912 b18 )
    ( on b326 b912 )
    ( on b284 b326 )
    ( on b903 b284 )
    ( on b892 b903 )
    ( on b660 b892 )
    ( on b366 b660 )
    ( on b606 b366 )
    ( on b961 b606 )
    ( on b386 b961 )
    ( on b410 b386 )
    ( on b101 b410 )
    ( on b579 b101 )
    ( on b440 b579 )
    ( on b864 b440 )
    ( clear b864 )
  )
  ( :tasks
    ( Make-20Pile b994 b360 b535 b930 b18 b912 b326 b284 b903 b892 b660 b366 b606 b961 b386 b410 b101 b579 b440 b864 )
  )
)
