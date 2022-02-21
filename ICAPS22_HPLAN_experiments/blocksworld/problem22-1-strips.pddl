( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b297 - block
    b316 - block
    b773 - block
    b315 - block
    b349 - block
    b450 - block
    b350 - block
    b98 - block
    b442 - block
    b55 - block
    b90 - block
    b776 - block
    b227 - block
    b632 - block
    b861 - block
    b71 - block
    b856 - block
    b193 - block
    b780 - block
    b82 - block
    b496 - block
    b779 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b297 b293 )
    ( on b316 b297 )
    ( on b773 b316 )
    ( on b315 b773 )
    ( on b349 b315 )
    ( on b450 b349 )
    ( on b350 b450 )
    ( on b98 b350 )
    ( on b442 b98 )
    ( on b55 b442 )
    ( on b90 b55 )
    ( on b776 b90 )
    ( on b227 b776 )
    ( on b632 b227 )
    ( on b861 b632 )
    ( on b71 b861 )
    ( on b856 b71 )
    ( on b193 b856 )
    ( on b780 b193 )
    ( on b82 b780 )
    ( on b496 b82 )
    ( on b779 b496 )
    ( clear b779 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
