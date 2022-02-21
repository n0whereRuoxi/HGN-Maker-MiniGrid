( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b917 - block
    b111 - block
    b373 - block
    b328 - block
    b887 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b917 )
    ( on b111 b917 )
    ( on b373 b111 )
    ( on b328 b373 )
    ( on b887 b328 )
    ( clear b887 )
  )
  ( :goal
    ( and
      ( clear b917 )
      ( clear b917 )
      ( clear b917 )
      ( clear b917 )
      ( clear b917 )
    )
  )
)
