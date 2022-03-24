( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b835 - block
    b837 - block
    b731 - block
    b875 - block
    b303 - block
    b347 - block
    b581 - block
    b57 - block
    b401 - block
    b25 - block
    b30 - block
    b998 - block
    b359 - block
    b237 - block
    b658 - block
    b620 - block
    b336 - block
    b672 - block
    b502 - block
    b387 - block
    b558 - block
    b616 - block
    b127 - block
    b2 - block
    b890 - block
    b970 - block
    b582 - block
    b95 - block
    b713 - block
    b470 - block
    b327 - block
    b935 - block
    b51 - block
    b832 - block
    b305 - block
    b517 - block
    b224 - block
    b719 - block
    b561 - block
    b855 - block
    b182 - block
    b331 - block
    b516 - block
    b901 - block
    b638 - block
    b429 - block
    b812 - block
    b180 - block
    b16 - block
    b457 - block
    b619 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b835 )
    ( on b837 b835 )
    ( on b731 b837 )
    ( on b875 b731 )
    ( on b303 b875 )
    ( on b347 b303 )
    ( on b581 b347 )
    ( on b57 b581 )
    ( on b401 b57 )
    ( on b25 b401 )
    ( on b30 b25 )
    ( on b998 b30 )
    ( on b359 b998 )
    ( on b237 b359 )
    ( on b658 b237 )
    ( on b620 b658 )
    ( on b336 b620 )
    ( on b672 b336 )
    ( on b502 b672 )
    ( on b387 b502 )
    ( on b558 b387 )
    ( on b616 b558 )
    ( on b127 b616 )
    ( on b2 b127 )
    ( on b890 b2 )
    ( on b970 b890 )
    ( on b582 b970 )
    ( on b95 b582 )
    ( on b713 b95 )
    ( on b470 b713 )
    ( on b327 b470 )
    ( on b935 b327 )
    ( on b51 b935 )
    ( on b832 b51 )
    ( on b305 b832 )
    ( on b517 b305 )
    ( on b224 b517 )
    ( on b719 b224 )
    ( on b561 b719 )
    ( on b855 b561 )
    ( on b182 b855 )
    ( on b331 b182 )
    ( on b516 b331 )
    ( on b901 b516 )
    ( on b638 b901 )
    ( on b429 b638 )
    ( on b812 b429 )
    ( on b180 b812 )
    ( on b16 b180 )
    ( on b457 b16 )
    ( on b619 b457 )
    ( clear b619 )
  )
  ( :tasks
    ( Make-50Pile b837 b731 b875 b303 b347 b581 b57 b401 b25 b30 b998 b359 b237 b658 b620 b336 b672 b502 b387 b558 b616 b127 b2 b890 b970 b582 b95 b713 b470 b327 b935 b51 b832 b305 b517 b224 b719 b561 b855 b182 b331 b516 b901 b638 b429 b812 b180 b16 b457 b619 )
  )
)
