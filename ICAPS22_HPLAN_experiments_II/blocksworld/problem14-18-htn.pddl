( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b562 - block
    b956 - block
    b462 - block
    b815 - block
    b837 - block
    b678 - block
    b624 - block
    b653 - block
    b377 - block
    b68 - block
    b23 - block
    b145 - block
    b143 - block
    b100 - block
    b386 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b562 )
    ( on b956 b562 )
    ( on b462 b956 )
    ( on b815 b462 )
    ( on b837 b815 )
    ( on b678 b837 )
    ( on b624 b678 )
    ( on b653 b624 )
    ( on b377 b653 )
    ( on b68 b377 )
    ( on b23 b68 )
    ( on b145 b23 )
    ( on b143 b145 )
    ( on b100 b143 )
    ( on b386 b100 )
    ( clear b386 )
  )
  ( :tasks
    ( Make-14Pile b956 b462 b815 b837 b678 b624 b653 b377 b68 b23 b145 b143 b100 b386 )
  )
)
