( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b116 - block
    b829 - block
    b395 - block
    b664 - block
    b553 - block
    b574 - block
    b27 - block
    b835 - block
    b799 - block
    b778 - block
    b895 - block
    b894 - block
    b455 - block
    b81 - block
    b278 - block
    b452 - block
    b459 - block
    b900 - block
    b955 - block
    b601 - block
    b115 - block
    b846 - block
    b844 - block
    b120 - block
    b767 - block
    b364 - block
    b863 - block
    b394 - block
    b336 - block
    b4 - block
    b647 - block
    b695 - block
    b977 - block
    b872 - block
    b878 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b116 )
    ( on b829 b116 )
    ( on b395 b829 )
    ( on b664 b395 )
    ( on b553 b664 )
    ( on b574 b553 )
    ( on b27 b574 )
    ( on b835 b27 )
    ( on b799 b835 )
    ( on b778 b799 )
    ( on b895 b778 )
    ( on b894 b895 )
    ( on b455 b894 )
    ( on b81 b455 )
    ( on b278 b81 )
    ( on b452 b278 )
    ( on b459 b452 )
    ( on b900 b459 )
    ( on b955 b900 )
    ( on b601 b955 )
    ( on b115 b601 )
    ( on b846 b115 )
    ( on b844 b846 )
    ( on b120 b844 )
    ( on b767 b120 )
    ( on b364 b767 )
    ( on b863 b364 )
    ( on b394 b863 )
    ( on b336 b394 )
    ( on b4 b336 )
    ( on b647 b4 )
    ( on b695 b647 )
    ( on b977 b695 )
    ( on b872 b977 )
    ( on b878 b872 )
    ( clear b878 )
  )
  ( :goal
    ( and
      ( clear b116 )
    )
  )
)
