<?php


class ExtTask extends \Phalcon\CLI\Task
{

    public function mainAction()
    {
        echo __METHOD__ . PHP_EOL;
    }

    public function updateAction()
    {
        $query = [
            '_source' => [
                'synced',
                'updated',
                'created',
                'urls.html'
            ],
            'filter'  => [
                'bool' => [
                    'must' => [
                        ['range' => ['synced' => ['gte' => 'now-1d']]],
                        ['term' => ['is_composer' => true]],
                    ],
                ]
            ],
            'sort'    => [
                'synced' => ['order' => 'asc']
            ],
            'size'    => 3,
        ];
        $results = \Models\Project::find($query)->getResults();
        foreach ($results as $project) {
            $data = $project->getData();
            try {
                $githubProject = new \Models\GithubProject($data['urls']['html']);
                $project = new \Models\Project($githubProject);
                $project->save();
            } catch(\Exception $e) {
                error_log(__METHOD__ . ' -- ' . $e->getMessage() . ' -- ' . $e->getTraceAsString());
            }
        }
    }
}
