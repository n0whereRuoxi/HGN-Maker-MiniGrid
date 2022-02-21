( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b942 - block
    b784 - block
    b2 - block
    b413 - block
    b386 - block
    b130 - block
    b932 - block
    b675 - block
    b968 - block
    b446 - block
    b52 - block
    b859 - block
    b567 - block
    b349 - block
    b537 - block
    b556 - block
    b214 - block
    b69 - block
    b113 - block
    b914 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b942 )
    ( on b784 b942 )
    ( on b2 b784 )
    ( on b413 b2 )
    ( on b386 b413 )
    ( on b130 b386 )
    ( on b932 b130 )
    ( on b675 b932 )
    ( on b968 b675 )
    ( on b446 b968 )
    ( on b52 b446 )
    ( on b859 b52 )
    ( on b567 b859 )
    ( on b349 b567 )
    ( on b537 b349 )
    ( on b556 b537 )
    ( on b214 b556 )
    ( on b69 b214 )
    ( on b113 b69 )
    ( on b914 b113 )
    ( clear b914 )
  )
  ( :goal
    ( and
      ( clear b942 )
    )
  )
)
