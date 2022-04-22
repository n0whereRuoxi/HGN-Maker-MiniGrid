( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b764 - block
    b371 - block
    b755 - block
    b174 - block
    b605 - block
    b308 - block
    b500 - block
    b46 - block
    b19 - block
    b13 - block
    b750 - block
    b621 - block
    b968 - block
    b422 - block
    b291 - block
    b712 - block
    b63 - block
    b225 - block
    b20 - block
    b426 - block
    b484 - block
    b891 - block
    b93 - block
    b165 - block
    b230 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b764 )
    ( on b371 b764 )
    ( on b755 b371 )
    ( on b174 b755 )
    ( on b605 b174 )
    ( on b308 b605 )
    ( on b500 b308 )
    ( on b46 b500 )
    ( on b19 b46 )
    ( on b13 b19 )
    ( on b750 b13 )
    ( on b621 b750 )
    ( on b968 b621 )
    ( on b422 b968 )
    ( on b291 b422 )
    ( on b712 b291 )
    ( on b63 b712 )
    ( on b225 b63 )
    ( on b20 b225 )
    ( on b426 b20 )
    ( on b484 b426 )
    ( on b891 b484 )
    ( on b93 b891 )
    ( on b165 b93 )
    ( on b230 b165 )
    ( on b231 b230 )
    ( clear b231 )
  )
  ( :goal
    ( and
      ( clear b764 )
    )
  )
)
