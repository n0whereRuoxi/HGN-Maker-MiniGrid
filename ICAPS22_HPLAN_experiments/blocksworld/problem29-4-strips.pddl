( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b665 - block
    b354 - block
    b557 - block
    b691 - block
    b582 - block
    b288 - block
    b713 - block
    b127 - block
    b7 - block
    b219 - block
    b339 - block
    b304 - block
    b283 - block
    b42 - block
    b139 - block
    b588 - block
    b624 - block
    b447 - block
    b69 - block
    b275 - block
    b974 - block
    b789 - block
    b704 - block
    b117 - block
    b507 - block
    b343 - block
    b807 - block
    b620 - block
    b461 - block
    b868 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b665 )
    ( on b354 b665 )
    ( on b557 b354 )
    ( on b691 b557 )
    ( on b582 b691 )
    ( on b288 b582 )
    ( on b713 b288 )
    ( on b127 b713 )
    ( on b7 b127 )
    ( on b219 b7 )
    ( on b339 b219 )
    ( on b304 b339 )
    ( on b283 b304 )
    ( on b42 b283 )
    ( on b139 b42 )
    ( on b588 b139 )
    ( on b624 b588 )
    ( on b447 b624 )
    ( on b69 b447 )
    ( on b275 b69 )
    ( on b974 b275 )
    ( on b789 b974 )
    ( on b704 b789 )
    ( on b117 b704 )
    ( on b507 b117 )
    ( on b343 b507 )
    ( on b807 b343 )
    ( on b620 b807 )
    ( on b461 b620 )
    ( on b868 b461 )
    ( clear b868 )
  )
  ( :goal
    ( and
      ( clear b665 )
    )
  )
)
