( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b194 - block
    b88 - block
    b36 - block
    b733 - block
    b276 - block
    b615 - block
    b483 - block
    b316 - block
    b192 - block
    b130 - block
    b321 - block
    b538 - block
    b917 - block
    b184 - block
    b973 - block
    b576 - block
    b75 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b194 )
    ( on b88 b194 )
    ( on b36 b88 )
    ( on b733 b36 )
    ( on b276 b733 )
    ( on b615 b276 )
    ( on b483 b615 )
    ( on b316 b483 )
    ( on b192 b316 )
    ( on b130 b192 )
    ( on b321 b130 )
    ( on b538 b321 )
    ( on b917 b538 )
    ( on b184 b917 )
    ( on b973 b184 )
    ( on b576 b973 )
    ( on b75 b576 )
    ( clear b75 )
  )
  ( :goal
    ( and
      ( clear b194 )
    )
  )
)
