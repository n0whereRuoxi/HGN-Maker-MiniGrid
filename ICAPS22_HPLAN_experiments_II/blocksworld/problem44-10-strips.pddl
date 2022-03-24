( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b795 - block
    b845 - block
    b571 - block
    b131 - block
    b810 - block
    b515 - block
    b34 - block
    b432 - block
    b603 - block
    b519 - block
    b771 - block
    b132 - block
    b761 - block
    b261 - block
    b588 - block
    b943 - block
    b180 - block
    b317 - block
    b590 - block
    b562 - block
    b983 - block
    b607 - block
    b813 - block
    b647 - block
    b189 - block
    b523 - block
    b962 - block
    b212 - block
    b65 - block
    b672 - block
    b776 - block
    b45 - block
    b896 - block
    b861 - block
    b568 - block
    b423 - block
    b906 - block
    b680 - block
    b448 - block
    b766 - block
    b340 - block
    b969 - block
    b874 - block
    b556 - block
    b82 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b795 )
    ( on b845 b795 )
    ( on b571 b845 )
    ( on b131 b571 )
    ( on b810 b131 )
    ( on b515 b810 )
    ( on b34 b515 )
    ( on b432 b34 )
    ( on b603 b432 )
    ( on b519 b603 )
    ( on b771 b519 )
    ( on b132 b771 )
    ( on b761 b132 )
    ( on b261 b761 )
    ( on b588 b261 )
    ( on b943 b588 )
    ( on b180 b943 )
    ( on b317 b180 )
    ( on b590 b317 )
    ( on b562 b590 )
    ( on b983 b562 )
    ( on b607 b983 )
    ( on b813 b607 )
    ( on b647 b813 )
    ( on b189 b647 )
    ( on b523 b189 )
    ( on b962 b523 )
    ( on b212 b962 )
    ( on b65 b212 )
    ( on b672 b65 )
    ( on b776 b672 )
    ( on b45 b776 )
    ( on b896 b45 )
    ( on b861 b896 )
    ( on b568 b861 )
    ( on b423 b568 )
    ( on b906 b423 )
    ( on b680 b906 )
    ( on b448 b680 )
    ( on b766 b448 )
    ( on b340 b766 )
    ( on b969 b340 )
    ( on b874 b969 )
    ( on b556 b874 )
    ( on b82 b556 )
    ( clear b82 )
  )
  ( :goal
    ( and
      ( clear b795 )
    )
  )
)
