( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b165 - block
    b594 - block
    b361 - block
    b413 - block
    b652 - block
    b207 - block
    b629 - block
    b329 - block
    b7 - block
    b802 - block
    b691 - block
    b944 - block
    b655 - block
    b675 - block
    b571 - block
    b292 - block
    b830 - block
    b488 - block
    b320 - block
    b747 - block
    b899 - block
    b441 - block
    b758 - block
    b205 - block
    b574 - block
    b394 - block
    b301 - block
    b807 - block
    b432 - block
    b977 - block
    b443 - block
    b72 - block
    b959 - block
    b360 - block
    b412 - block
    b866 - block
    b775 - block
    b439 - block
    b780 - block
    b543 - block
    b719 - block
    b785 - block
    b740 - block
    b37 - block
    b858 - block
    b183 - block
    b607 - block
    b800 - block
    b512 - block
    b184 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b165 )
    ( on b594 b165 )
    ( on b361 b594 )
    ( on b413 b361 )
    ( on b652 b413 )
    ( on b207 b652 )
    ( on b629 b207 )
    ( on b329 b629 )
    ( on b7 b329 )
    ( on b802 b7 )
    ( on b691 b802 )
    ( on b944 b691 )
    ( on b655 b944 )
    ( on b675 b655 )
    ( on b571 b675 )
    ( on b292 b571 )
    ( on b830 b292 )
    ( on b488 b830 )
    ( on b320 b488 )
    ( on b747 b320 )
    ( on b899 b747 )
    ( on b441 b899 )
    ( on b758 b441 )
    ( on b205 b758 )
    ( on b574 b205 )
    ( on b394 b574 )
    ( on b301 b394 )
    ( on b807 b301 )
    ( on b432 b807 )
    ( on b977 b432 )
    ( on b443 b977 )
    ( on b72 b443 )
    ( on b959 b72 )
    ( on b360 b959 )
    ( on b412 b360 )
    ( on b866 b412 )
    ( on b775 b866 )
    ( on b439 b775 )
    ( on b780 b439 )
    ( on b543 b780 )
    ( on b719 b543 )
    ( on b785 b719 )
    ( on b740 b785 )
    ( on b37 b740 )
    ( on b858 b37 )
    ( on b183 b858 )
    ( on b607 b183 )
    ( on b800 b607 )
    ( on b512 b800 )
    ( on b184 b512 )
    ( clear b184 )
  )
  ( :goal
    ( and
      ( clear b165 )
    )
  )
)
