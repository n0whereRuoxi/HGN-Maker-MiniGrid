( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b100 - block
    b600 - block
    b594 - block
    b196 - block
    b620 - block
    b117 - block
    b693 - block
    b686 - block
    b632 - block
    b723 - block
    b532 - block
    b948 - block
    b276 - block
    b192 - block
    b574 - block
    b864 - block
    b146 - block
    b277 - block
    b616 - block
    b225 - block
    b930 - block
    b965 - block
    b373 - block
    b803 - block
    b585 - block
    b659 - block
    b773 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b100 )
    ( on b600 b100 )
    ( on b594 b600 )
    ( on b196 b594 )
    ( on b620 b196 )
    ( on b117 b620 )
    ( on b693 b117 )
    ( on b686 b693 )
    ( on b632 b686 )
    ( on b723 b632 )
    ( on b532 b723 )
    ( on b948 b532 )
    ( on b276 b948 )
    ( on b192 b276 )
    ( on b574 b192 )
    ( on b864 b574 )
    ( on b146 b864 )
    ( on b277 b146 )
    ( on b616 b277 )
    ( on b225 b616 )
    ( on b930 b225 )
    ( on b965 b930 )
    ( on b373 b965 )
    ( on b803 b373 )
    ( on b585 b803 )
    ( on b659 b585 )
    ( on b773 b659 )
    ( clear b773 )
  )
  ( :goal
    ( and
      ( clear b100 )
    )
  )
)
