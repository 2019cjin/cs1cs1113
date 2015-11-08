module baseball

import list

data team = DiamondBacks | Cardinals | Yankees | Nationals | Royals

||| A record of a team, its hits, its doubles, its triples, its home runs
data teamrow = mkTeamrow team Nat Nat Nat Nat

d: teamrow
d = mkTeamrow DiamondBacks 1379 259 47 118

c: teamrow
c = mkTeamrow Cardinals 1371 275 21 105

y: teamrow
y = mkTeamrow Yankees 1349 247 26 147

n: teamrow
n = mkTeamrow Nationals 1403 265 27 152

r: teamrow
r = mkTeamrow Royals 1456 289 29 95

||| functions for teamrow
teamname: teamrow -> team
teamname (mkTeamrow n h d t r) = n

hits: teamrow -> Nat
hits (mkTeamrow n h d t r) = h

doubles: teamrow -> Nat
doubles (mkTeamrow n h d t r) = d

triples: teamrow -> Nat
triples (mkTeamrow n h d t r) = t

homeruns: teamrow -> Nat
homeruns (mkTeamrow n h d t r) = r

||| list of teamrow
teamlist: list teamrow
teamlist = d :: c :: y :: n :: r :: nil
